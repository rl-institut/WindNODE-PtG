-- metadata
COMMENT ON TABLE environment.lfu_waterreserves_brandenburg IS '{
    "title": "Wasserschutzgebiete des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "Der Datenbestand umfasst die Wasserschutzgebiete des Landes Brandenburg.",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2017-02-10",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Wasser. (08.06.2017)", "description": "Der Datenbestand umfasst die Wasserschutzgebiete des Landes Brandenburg.", "url": "https://metaver.de/search/dls/#?serviceId=365B64CD-55CA-4C65-8F48-8B93B9C06E40&datasetId=657B712B-9009-49C0-8C91-A373AA87291A", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
        {"name": "", "description": "", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "Datenlizenz Deutschland - Namensnennung",
        "version": "2.0",
        "url": "https://www.govdata.de/dl-de/by-2-0; dl-de-by-2.0",
        "instruction": "Namensnennung: Landesamt für Umwelt Brandenburg, Angabe der URL der Datenquelle, Angabe der Datensatzbezeichnung",
        "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-07-26", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "environment.lfu_waterreserves_brandenburg",        
        "format": "PostgreSQL",
        "fields": [
            {"name": "flaeche", "description": "Fläche des WSG in Quadratmeter", "unit": "m²"},
            {"name": "g_id", "description": "GIS-Ident-Nummer des WSG (eindeutig)", "unit": ""},
            {"name": "id_nr", "description": "Ident-Nummer der WSG-Teilfläche", "unit": ""},
            {"name": "code", "description": "Art der Schutzzone (siehe auch SCHUTZZONE):10 für Zone I, 20 für Zone II, 30 für Zone III, 31 für Zone III A, 32 für Zone III B", "unit": ""},
            {"name": "schutzzone", "description": "Beschreibung der Schutzzonenart ", "unit": ""},
            {"name": "klarname", "description": "WSG-Name", "unit": ""},
            {"name": "kartenblat", "description": "TK 10 Blatt des Flächenschwerpunktes des WSG", "unit": ""},
            {"name": "wsg_id", "description": "Ident-Nummer des WSG", "unit": ""},
            {"name": "landkreis", "description": "Landkreis des Flächenschwerpunktes des WSG", "unit": ""},
            {"name": "fundstelle", "description": "Beschlussnummer/Verordnungsfundstelle", "unit": ""},
            {"name": "wsg_vom", "description": "Datum des Beschlusses/der VO im Format TT.MM.JJJJ", "unit": ""},
            {"name": "durch", "description": "Festsetzung durch Kreistag/Verordnungsgeber", "unit": ""},
            {"name": "vo_text", "description": "Internetlink zum Verordnungstext im BRAVORS", "unit": ""},
            {"name": "shape_area", "description": "Fläche eines Polygons in m²", "unit": "m²"},
            {"name": "shape_len", "description": "Länge der Außenlinie eines Polygons in m", "unit": "m"}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lfu_waterreserves_brandenburg' ::regclass) ::json;
