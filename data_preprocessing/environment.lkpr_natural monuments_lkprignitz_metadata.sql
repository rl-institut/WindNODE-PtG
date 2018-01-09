-- metadata
COMMENT ON TABLE environment.lkpr_naturalmonuments_lkprignitz IS '{
    "title": "Naturdenkmale des Landkreises Prignitz als Punktgeometrie (Point)",
    "description": "",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreis Prignitz",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "none",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landkreis Prignitz, Sb Natur- und Gewässerschutz, Herr Klemp", "description": "", "url": "", "license": "", "copyright": ""},
        {"name": "", "description": "", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "Nutzung in der Masterarbeit unter Angabe des Quellenvermerkes (Landkreis Prignitz) zu verwenden. Eine Weitergabe oder Veröffentlichung der Daten über den Projektzweck hinaus ist nicht gestattet",
        "copyright": "Landkreis Prignitz"},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-0-27", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "environment.lkpr_naturalmonuments_lkprignitz",        
        "format": "PostgreSQL",
        "fields": [
            {"name": "", "description": "", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lkpr_naturalmonuments_lkprignitz' ::regclass) ::json;
