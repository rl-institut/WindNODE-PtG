-- metadata
COMMENT ON TABLE environment.lfu_ffhareas_brandenburg IS '{
    "title": "Fauna-Flora-Habitat (FFH)-Gebiete des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "FFH-Gebiete sind Gebiete von gemeinschaftlicher Bedeutung gemäß der EU-Richtlinie 92/43/EWG (Fauna-Flora-Habitatrichtlinie).",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2017-02-03",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Naturschutz. (20.03.2017) ", "description": "FFH-Gebiete sind Gebiete von gemeinschaftlicher Bedeutung gemäß der EU-Richtlinie 92/43/EWG (Fauna-Flora-Habitatrichtlinie).", "url": "https://metaver.de/search/dls/#?serviceId=AC198EC3-DAE6-4F8F-9FF6-62375FCEF7C6&datasetId=7DE3A549-769C-4F01-A5E6-B3E25D40975E", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
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
        {"name": "environment.lfu_ffhareas_brandenburg",
        "format": "PostgreSQL",
        "fields": [
            {"name": "area", "description": "Flächengröße in m2", "unit": "m2"},
            {"name": "typ_kurz", "description": "Abkürzung für den Schutzgebietstyp", "unit": ""},
            {"name": "typ", "description": "Langbezeichnung des Schutzgebietstyp", "unit": ""},
            {"name": "ffh_nr", "description": "Landesinterne Nummer der FFH-Gebiete", "unit": ""},
            {"name": "ffh_name", "description": "Gebietsname", "unit": ""},
            {"name": "natura_nr", "description": "Offizielle NATURA 2000- Nummer, z.B. DE 2837-301", "unit": ""},
            {"name": "eu_staat_i", "description": "DE als Staatenkürzel für Deutschland", "unit": ""},
            {"name": "bl_id", "description": "12 als Kennziffer für das Bundesland Brandenburg", "unit": ""},
            {"name": "orig_fid", "description": "Original-FID vor Aufteilung Multipart-Polygone", "unit": ""},
            {"name": "shape_area", "description": "Fläche eines Polygons in m²", "unit": "m²"},
            {"name": "shape_len", "description": "Länge der Außenlinie eines Polygons in m", "unit": "m"}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lfu_ffhareas_brandenburg' ::regclass) ::json;
