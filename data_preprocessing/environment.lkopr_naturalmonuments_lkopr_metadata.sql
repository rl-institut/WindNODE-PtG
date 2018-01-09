-- metadata
COMMENT ON TABLE environment.lkopr_naturalmonuments_lkopr IS '{
    "title": "Naturdenkmale des Landkreises Ostprignitz-Ruppin als Punktgeometrie (Point)",
    "description": "",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreis Ostprignitz-Ruppin",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "none",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landkreis Ostprignitz-Ruppin, Bau- und Umweltamt, untere Bodenschutzbehörde, Herr Wollschläger", "description": "", "url": "", "license": "", "copyright": ""},
        {"name": "", "description": "", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "Vervielfältigung, Veröffentlichung, Reproduktion, Manipulation und Veränderung erlaubt. Eine kommerzielle Nutzung der Daten, zum Beispiel der Verkauf, ist ausgeschlossen.",
        "copyright": ""},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-08-03", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "environment.lkopr_naturalmonuments_lkopr",        
        "format": "PostgreSQL",
        "fields": [
            {"name": "gemeinde", "description": "", "unit": ""},
            {"name": "name", "description": "", "unit": ""},
            {"name": "lat_name", "description": "Lateinischer Name", "unit": ""},
            {"name": "nummer", "description": "", "unit": ""},
            {"name": "ort", "description": "", "unit": ""},
            {"name": "lage", "description": "", "unit": ""},
            {"name": "datum", "description": "", "unit": ""},
            {"name": "zusatz", "description": "", "unit": ""},
            {"name": "n", "description": "", "unit": ""},
            {"name": "e", "description": "", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lkopr_naturalmonuments_lkopr' ::regclass) ::json;
