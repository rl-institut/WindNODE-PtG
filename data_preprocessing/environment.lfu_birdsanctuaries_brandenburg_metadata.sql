-- metadata
COMMENT ON TABLE environment.lfu_birdsanctuaries_brandenburg IS '{
    "title": "Vogelschutzgebiete (SPA) des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "Der Datenbestand umfasst die Vogelschutzgebiete des Landes Brandenburg gemäß der EU-Vogelschutzrichtlinie.",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2010-02-05",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Naturschutz. (20.03.2017) ", "description": "Der Datenbestand umfasst die Vogelschutzgebiete des Landes Brandenburg gemäß der EU-Vogelschutzrichtlinie.", "url": "https://metaver.de/search/dls/#?serviceId=AC198EC3-DAE6-4F8F-9FF6-62375FCEF7C6&datasetId=F88F1BEB-FD2C-41AE-B3A4-94711747DA7D", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
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
        {"name": "environment.lfu_birdsanctuaries_brandenburg",
        "format": "PostgreSQL",
        "fields": [
            {"name": "area", "description": "Flächengröße in m²", "unit": "m²"},
            {"name": "typ_kurz", "description": "Schutzgebietstyp_kurz", "unit": ""},
            {"name": "typ", "description": "Schutzgebietstyp", "unit": ""},
            {"name": "spa_nr", "description": "Landesinterne Nummer der SPAGebiete", "unit": ""},
            {"name": "spa_name", "description": "Gebietsname", "unit": ""},
            {"name": "natura_nr", "description": "Offizielle NATURA 2000-Nummer", "unit": ""},
            {"name": "eu_staat_i", "description": "DE als Staatenkürzel für Deutschland", "unit": ""},
            {"name": "bl_id", "description": "12 als Kennziffer für das Bundesland Brandenburg", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lfu_birdsanctuaries_brandenburg' ::regclass) ::json;
