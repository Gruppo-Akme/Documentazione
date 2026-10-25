#!/usr/bin/env python3
"""
update_website.py
Aggiorna automaticamente:
1. website/index.html: elenca i documenti PDF (compilati da Typst o caricati direttamente
   come .pdf in src/ o output/) nelle rispettive sezioni (Candidatura, RTB, PB, Diapositive).
   - Ordina sempre i verbali e i diari di bordo/presentazioni dal più recente in cima al più vecchio in coda.
   - Pulisce e rimuove ogni volta i vecchi collegamenti obsoleti sostituendoli con quelli aggiornati.
2. website/glossary.html: sincronizza le voci dal glossario (es. src/glossario.json)
   nelle corrispondenti sezioni alfabetiche (<section id="a">...<dl>).
"""

import sys
import re
import json
import shutil
import urllib.parse
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = REPO_ROOT / "src"
OUT_DIR = REPO_ROOT / "output"
WEBSITE_DIR = REPO_ROOT / "website"
INDEX_HTML = WEBSITE_DIR / "index.html"
GLOSSARY_HTML = WEBSITE_DIR / "glossary.html"
GLOSSARY_JSON = SRC_DIR / "glossario.json"

# Sezioni e categorie fisse previste in website/index.html
SECTIONS_CATEGORIES = {
    "candidatura": ["Documenti", "Verbali Esterni", "Verbali Interni"],
    "rtb": ["Documenti Esterni", "Documenti Interni", "Verbali Esterni", "Verbali Interni"],
    "pb": ["Documenti Esterni", "Documenti Interni", "Verbali Esterni", "Verbali Interni"],
    "diapositive": ["Presentazioni"],
}


def sync_source_pdfs_to_output():
    """
    Se vengono caricati file .pdf direttamente in src/ (es. slide esportate da Canva
    o presentazioni di Diario di Bordo), li sincronizza nella corrispondente cartella
    in output/ in modo che siano accessibili dai collegamenti del sito web.
    """
    if not SRC_DIR.exists():
        return

    for src_pdf in SRC_DIR.rglob("*.pdf"):
        if "testTemplates" in src_pdf.parts or src_pdf.name.startswith("."):
            continue

        rel = src_pdf.relative_to(SRC_DIR)
        out_pdf = OUT_DIR / rel

        # Copia se non esiste ancora in output o se la versione sorgente è stata aggiornata
        if not out_pdf.exists() or src_pdf.stat().st_mtime > out_pdf.stat().st_mtime:
            out_pdf.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(src_pdf, out_pdf)
            print(f"Sincronizzato PDF da src a output: {rel}")


def extract_title_from_typ(typ_path):
    """Estrae il titolo del documento da un file .typ se disponibile."""
    if not typ_path.exists():
        return None
    try:
        content = typ_path.read_text(encoding="utf-8")
        m = re.search(r'(?:titolo|title)\s*:\s*"([^"]+)"', content)
        if m:
            return m.group(1).strip()
    except Exception:
        pass
    return None


def get_document_title(pdf_rel_path, typ_rel_path):
    """Determina il titolo più leggibile per il link del documento."""
    typ_full_path = SRC_DIR / typ_rel_path
    if typ_full_path.exists():
        title = extract_title_from_typ(typ_full_path)
        if title:
            return title

    stem = Path(pdf_rel_path).stem
    path_str = str(pdf_rel_path).lower()

    # Cerca pattern data: YYYY-MM-DD o DD-MM-YYYY
    date_match = re.search(r"(\d{4})[-_](\d{2})[-_](\d{2})", stem)
    if date_match:
        y, m, d = date_match.groups()
    else:
        date_match_inv = re.search(r"(\d{2})[-_](\d{2})[-_](\d{4})", stem)
        if date_match_inv:
            d, m, y = date_match_inv.groups()
        else:
            d, m, y = None, None, None

    if d and m and y:
        if "diario" in path_str:
            return f"Diario di Bordo {d}/{m}/{y}"
        elif "intern" in path_str and "verb" in path_str:
            return f"Verbale Interno {d}/{m}/{y}"
        elif "estern" in path_str and "verb" in path_str:
            return f"Verbale Esterno {d}/{m}/{y}"
        elif "intern" in path_str:
            return f"Verbale Interno {d}/{m}/{y}"
        elif "estern" in path_str:
            return f"Verbale Esterno {d}/{m}/{y}"
        elif "verb" in path_str:
            return f"Verbale {d}/{m}/{y}"
        elif "diapositiv" in path_str or "presentaz" in path_str:
            return f"Presentazione {d}/{m}/{y}"

    # Pulizia del nome file descrittivo (rimuove underscore e trattini)
    cleaned = stem.replace("_", " ").replace("-", " ")
    return cleaned.strip().title()


def extract_date_key(title, filename):
    """
    Estrae una chiave data (anno, mese, giorno) dal nome file o dal titolo per
    ordinare la lista in ordine decrescente (più recente in cima, più vecchio in fondo).
    """
    # 1. YYYY-MM-DD o YYYY_MM_DD nel nome del file
    m = re.search(r"(\d{4})[-_](\d{2})[-_](\d{2})", filename)
    if m:
        return (int(m.group(1)), int(m.group(2)), int(m.group(3)))

    # 2. DD-MM-YYYY o DD_MM_YYYY nel nome del file
    m = re.search(r"(\d{2})[-_](\d{2})[-_](\d{4})", filename)
    if m:
        return (int(m.group(3)), int(m.group(2)), int(m.group(1)))

    # 3. DD/MM/YYYY nel titolo
    m = re.search(r"(\d{1,2})/(\d{1,2})/(\d{4})", title)
    if m:
        return (int(m.group(3)), int(m.group(2)), int(m.group(1)))

    # 4. YYYY/MM/DD nel titolo
    m = re.search(r"(\d{4})/(\d{1,2})/(\d{1,2})", title)
    if m:
        return (int(m.group(1)), int(m.group(2)), int(m.group(3)))

    return (0, 0, 0)


def map_path_to_section_and_category(rel_path):
    """
    Dato un percorso relativo (es. Candidatura/Verbali Interni/2026-10-15.pdf),
    restituisce la tupla (section_id, category_header).
    """
    parts = Path(rel_path).parts
    if not parts:
        return None, None

    section_folder = parts[0].lower()

    if "candidatura" in section_folder:
        sec_id = "candidatura"
        sub = parts[1].lower() if len(parts) > 2 else ""
        if "intern" in sub:
            cat = "Verbali Interni"
        elif "estern" in sub:
            cat = "Verbali Esterni"
        else:
            cat = "Documenti"
        return sec_id, cat

    elif "rtb" in section_folder:
        sec_id = "rtb"
        sub = parts[1].lower() if len(parts) > 2 else ""
        if "intern" in sub and "verb" in sub:
            cat = "Verbali Interni"
        elif "estern" in sub and "verb" in sub:
            cat = "Verbali Esterni"
        elif "intern" in sub:
            cat = "Documenti Interni"
        elif "estern" in sub:
            cat = "Documenti Esterni"
        else:
            cat = "Documenti Interni"
        return sec_id, cat

    elif "pb" in section_folder:
        sec_id = "pb"
        sub = parts[1].lower() if len(parts) > 2 else ""
        if "intern" in sub and "verb" in sub:
            cat = "Verbali Interni"
        elif "estern" in sub and "verb" in sub:
            cat = "Verbali Esterni"
        elif "intern" in sub:
            cat = "Documenti Interni"
        elif "estern" in sub:
            cat = "Documenti Esterni"
        else:
            cat = "Documenti Interni"
        return sec_id, cat

    elif "diario" in section_folder or "diapositiv" in section_folder:
        sec_id = "diapositive"
        cat = "Presentazioni"
        return sec_id, cat

    return None, None


def update_index_html():
    """Scansiona i documenti disponibili e rigenera website/index.html."""
    if not INDEX_HTML.exists():
        print(f"File non trovato: {INDEX_HTML}", file=sys.stderr)
        return

    # Sincronizza eventuali PDF caricati in src/ direttamente verso output/
    sync_source_pdfs_to_output()

    # Mappa dei file unici: rel_pdf -> (title, href, rel_path_str)
    documents_map = {}

    # 1. Scansiona i PDF presenti in output/
    if OUT_DIR.exists():
        for pdf_file in OUT_DIR.rglob("*.pdf"):
            if "testTemplates" in pdf_file.parts or pdf_file.name.startswith("."):
                continue
            rel = pdf_file.relative_to(OUT_DIR)
            rel_typ = rel.with_suffix(".typ")
            title = get_document_title(rel, rel_typ)
            encoded_rel = "/".join(urllib.parse.quote(part) for part in rel.parts)
            href = f"../output/{encoded_rel}"
            documents_map[rel] = (title, href, str(rel))

    # 2. Se in src/ c'è un sorgente .typ non ancora compilato in output/, includilo comunque
    if SRC_DIR.exists():
        for typ_file in SRC_DIR.rglob("*.typ"):
            if typ_file.name.startswith("template") or typ_file.name.startswith("lib"):
                continue
            if "testTemplates" in typ_file.parts or typ_file.name.startswith("."):
                continue

            rel_typ = typ_file.relative_to(SRC_DIR)
            rel_pdf = rel_typ.with_suffix(".pdf")
            if rel_pdf not in documents_map:
                title = get_document_title(rel_pdf, rel_typ)
                encoded_rel = "/".join(urllib.parse.quote(part) for part in rel_pdf.parts)
                href = f"../output/{encoded_rel}"
                documents_map[rel_pdf] = (title, href, str(rel_pdf))

    # Raggruppa i documenti per (section_id, category)
    docs_by_category = {}
    for rel_pdf, doc_info in documents_map.items():
        rel_str = doc_info[2]
        sec_id, cat = map_path_to_section_and_category(rel_str)
        if not sec_id or not cat:
            continue
        docs_by_category.setdefault((sec_id, cat), []).append(doc_info)

    # Ordina ciascuna lista in ordine DECRESCENTE (più recente in cima, più vecchio in fondo)
    for key in docs_by_category:
        docs_by_category[key].sort(
            key=lambda item: (extract_date_key(item[0], item[2]), item[2]),
            reverse=True
        )

    content = INDEX_HTML.read_text(encoding="utf-8")

    # Aggiorna e ripulisce ogni categoria in ciascuna sezione
    for sec_id, categories in SECTIONS_CATEGORIES.items():
        sec_pattern = rf'(<section id="{sec_id}"[^>]*>)([\s\S]*?)(</section>)'
        sec_match = re.search(sec_pattern, content)
        if not sec_match:
            continue

        sec_open, section_body, sec_close = sec_match.groups()

        for i, cat in enumerate(categories):
            doc_list = docs_by_category.get((sec_id, cat), [])

            # Spaziatura finale prima del prossimo tag
            is_last = (i == len(categories) - 1)
            end_indent = "\n    " if is_last else "\n      "

            # Genera i nuovi tag <h4> per i documenti presenti o un commento placeholder se vuota
            if doc_list:
                items_html = [
                    f'<h4><a href="{href}" target="_blank">{title}</a></h4>'
                    for title, href, _ in doc_list
                ]
                new_block = "\n      " + "\n      ".join(items_html) + end_indent
            else:
                new_block = "\n      <!-- In attesa di documenti -->" + end_indent

            # Sostituisce integralmente il blocco precedente sotto l'<h3> della categoria
            # consumando tutto fino al prossimo <h3> o alla fine della sezione
            cat_pattern = rf'(<h3>{re.escape(cat)}</h3>)[\s\S]*?(?=(?:<h3>|$))'
            section_body = re.sub(cat_pattern, rf'\g<1>{new_block}', section_body, count=1)

        # Ricomponi la sezione aggiornata nel documento HTML
        content = content[:sec_match.start()] + sec_open + section_body + sec_close + content[sec_match.end():]

    INDEX_HTML.write_text(content, encoding="utf-8")
    print("website/index.html aggiornato con successo.")


def update_glossary_html():
    """Sincronizza le voci da src/glossario.json in website/glossary.html."""
    if not GLOSSARY_HTML.exists() or not GLOSSARY_JSON.exists():
        return

    try:
        data = json.loads(GLOSSARY_JSON.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"Avviso parsing {GLOSSARY_JSON}: {e}", file=sys.stderr)
        return

    # Raggruppa per lettera iniziale
    by_letter = {}
    for term, definition in data.items():
        first_letter = term.strip()[0].lower() if term.strip() else ""
        if first_letter.isalpha():
            by_letter.setdefault(first_letter, []).append((term.strip(), definition.strip()))

    content = GLOSSARY_HTML.read_text(encoding="utf-8")

    for letter, items in by_letter.items():
        items.sort(key=lambda x: x[0].lower())
        dl_items = []
        for term, definition in items:
            dl_items.append(f"      <dt>{term}</dt>\n      <dd>{definition}</dd>")
        dl_inner = "\n" + "\n".join(dl_items) + "\n    "

        # Sostituisci il contenuto di <section id="letter">...<dl>...</dl>
        pattern = rf'(<section id="{letter}">\s*<h2>{letter.upper()}</h2>\s*<dl>)([\s\S]*?)(</dl>\s*</section>)'
        if re.search(pattern, content, flags=re.IGNORECASE):
            content = re.sub(pattern, rf'\g<1>{dl_inner}\g<3>', content, flags=re.IGNORECASE)

    GLOSSARY_HTML.write_text(content, encoding="utf-8")
    print("website/glossary.html sincronizzato con src/glossario.json.")


def main():
    update_index_html()
    update_glossary_html()


if __name__ == "__main__":
    main()

