-- metadata
COMMENT ON TABLE grid.windnode_gas IS '{
    "title": "Gasnetz der Landkreise Prignitz und Ostprignitz-Ruppin als Liniengeometrie (MultiLineString)",
    "description": "Gasverteilnetze der Landkreise Prignitz und Ostprignitz-Ruppin",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreise Prignitz und Ostprignitz-Ruppin",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2013-08-01",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Regionales Energiekonzept für die Region Prignitz-Oberhavel, Endbericht August 2013", "description": "Erstellt von: Regionale Planungsgemeinschaft Prignitz-Oberhavel mit Unterstützung von Ernst Basler+Partner", "url": "http://www.prignitz-oberhavel.de/fileadmin/dateien/dokumente/energiekonzept/REnKon_Endbericht.pdf", "license": "", "copyright": ""},
        {"name": "Anna Seefried", "description": "Digitalizationand Georeferencing", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "",
        "copyright": "tba"},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-07-27", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "grid.windnode_gas",
        "format": "PostgreSQL",
        "fields": [
            {"name": "id", "description": "Identifikationsschlüssel", "unit": ""},
            {"name": "region", "description": "Untersuchungsregion", "unit": ""},
            {"name": "colour", "description": "Farbe der Leitung auf Landkarte", "unit": ""},
            {"name": "width", "description": "Dicke der Leitung auf Landkarte", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('grid.windnode_gas' ::regclass) ::json;
