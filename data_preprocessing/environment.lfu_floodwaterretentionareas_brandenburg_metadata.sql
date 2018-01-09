-- metadata
COMMENT ON TABLE environment.lfu_floodwaterretentionareas_brandenburg IS '{
    "title": "Festgesetzte Überschwemmungsgebiete des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "Der Geodatensatz enthält alle nach § 100 Abs. 2 Satz 2 BbgWG bereits festgesetzten Überschwemmungsgebiete des Landes Brandenburg einschließlich der dazugehörenden Vorländer.",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2016-01-31",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Wasser. (08.06.2017)", "description": "Der Geodatensatz enthält alle nach § 100 Abs. 2 Satz 2 BbgWG bereits festgesetzten Überschwemmungsgebiete des Landes Brandenburg einschließlich der dazugehörenden Vorländer.", "url": "https://metaver.de/search/dls/#?serviceId=365B64CD-55CA-4C65-8F48-8B93B9C06E40&datasetId=830D525C-66F1-4112-9EF5-E8341685CC9E", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
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
        {"name": "environment.lfu_floodwaterretentionareas_brandenburg",
        "format": "PostgreSQL",
        "fields": [
            {"name": "satz", "description": "1: Fläche ist Bestandteil des Satz 1 Gebietes, 2: Fläche ist Bestandteil des Satz 2 Gebietes, 0: Keine Trennung erfolgt bzw. notwendig", "unit": ""},
            {"name": "flussgeb", "description": "Name des Flussgebiets", "unit": ""},
            {"name": "stand", "description": "Bearbeitungsstand (Tag.Monat.Jahr)", "unit": ""},
            {"name": "scale", "description": "Zielmaßstab des Datensatzes, Standard: 1:2.500", "unit": ""},
            {"name": "shape_area", "description": "Fläche eines Polygons in m²", "unit": "m²"},
            {"name": "shape_len", "description": "Länge der Außenlinie eines Polygons in m", "unit": "m"}]}],
    "metadata_version": "1.3"}';


-- select description
SELECT obj_description('environment.lfu_floodwaterretentionareas_brandenburg' ::regclass) ::json;
