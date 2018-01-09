-- metadata
COMMENT ON TABLE environment.lfu_biotopes_brandenburg IS '{
    "title": "Biotope des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "Kartierung von Biotopen, geschützten Biotopen (§ 30 BNatSchG und § 18 BbgNatSchAG) und FFH-Lebensräumen im Land Brandenburg",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2016-11-15",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Naturschutz. (20.03.2017) ", "description": "Kartierung von Biotopen, geschützten Biotopen (§ 30 BNatSchG und § 18 BbgNatSchAG) und FFH-Lebensräumen im Land Brandenburg", "url": "https://metaver.de/trefferanzeige?docuuid=A061BB02-70AC-4422-BB58-4A49F585D7F2", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
        {"name": "", "description": "", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "Datenlizenz Deutschland - Namensnennung",
        "version": "2.0",
        "url": "https://www.govdata.de/dl-de/by-2-0; dl-de-by-2.0",
        "instruction": "Namensnennung: Landesamt für Umwelt Brandenburg, Angabe der URL der Datenquelle, Angabe der Datensatzbezeichnung",
        "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-07-27", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "environment.lfu_biotopes_brandenburg",
        "format": "PostgreSQL",
        "fields": [
            {"name": "verwalt", "description": "Auftrags-/ Verwaltungsnummer des LfU", "unit": ""},
            {"name": "tk", "description": "TK 10 Blattnummer", "unit": ""},
            {"name": "gebnra", "description": "Laufende Biotopnummer auf Kartenblatt bzw. im FFH-Gebiet", "unit": ""},
            {"name": "gsg", "description": "Kürzel für die zugehörige BBK-Datenbank (z.B. für jeweilige Großschutzgebiete)", "unit": ""},
            {"name": "pk_ident", "description": "Eindeutige Biotop-Identifikationsnummer aus den Feldern VERWALT, TK und ID", "unit": ""},
            {"name": "biotyp", "description": "Code Biotoptyp", "unit": ""},
            {"name": "biotyp_t", "description": "Biotoptyp", "unit": ""},
            {"name": "bioalte", "description": "Code alternativer Biotopcode", "unit": ""},
            {"name": "bioalte_t", "description": "alternativer Biotoptyp", "unit": ""},
            {"name": "datum_e", "description": "Datum der ersten Kartierung", "unit": ""},
            {"name": "datum_f", "description": "Datum der letzten Kartierung", "unit": ""},
            {"name": "ausb", "description": "Code der Biotopausbildung", "unit": ""},
            {"name": "aus_t", "description": "Biotopausbildung", "unit": ""},
            {"name": "bbgnat", "description": "Code des Schutzstatus nach § 30 BNatSchG in Verbindung mit § 18 BbgNatSchG des Biotops", "unit": ""},
            {"name": "bbgnat_t", "description": "Schutzstatus nach § 30 BNatSchG in Verbindung mit § 18 BbgNatSchG des Biotops", "unit": ""},
            {"name": "ffhlrt", "description": "Code des FFH-Lebensraumtyps (LRT-Zuordnung des Biotops)", "unit": ""},
            {"name": "ffhlrt_t", "description": "FFH-Lebensraumty", "unit": ""},
            {"name": "ffhart", "description": "Bewertung Arteninventar des LRT", "unit": ""},
            {"name": "ffhbee", "description": "Bewertung Beeinträchtigung des LRT", "unit": ""},
            {"name": "ffhhab", "description": "Bewertung Habitatstruktur des LRT", "unit": ""},
            {"name": "ffhges", "description": "Erhaltungszustand / Erhaltungsgrad des LRT Gesamtbewertung", "unit": ""},
            {"name": "inten", "description": "Code der Kartierintensität gemäß Biotopkartieranleitung", "unit": ""},
            {"name": "inten_t", "description": "Kartierintensität gemäß Biotopkartieranleitung", "unit": ""},
            {"name": "ffh_nr", "description": "verwaltungsinterne Nummer des FFH-Gebietes (dreistellig)", "unit": ""},
            {"name": "id", "description": "Laufende Biotopnummer auf Kartenblatt bzw. im FFH-Gebiet (als Zeichenkette), gebildet aus GEBNRA, auf 4 Stellen mit 0 aufgefüllt", "unit": ""},
            {"name": "bbk_symb", "description": "Code zur Symboldarstellung in der Legende", "unit": ""},
            {"name": "shape_area", "description": "Fläche eines Polygons in m²", "unit": "m²"},
            {"name": "shape_len", "description": "Länge der Außenlinie eines Polygons in m", "unit": "m"}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lfu_biotopes_brandenburg' ::regclass) ::json;
