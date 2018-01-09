-- metadata
COMMENT ON TABLE environment.windnode_ptg_prignitz IS '{
    "title": "CO2-Quellen in den Landkreisen Prignitz und Ostprignitz-Ruppin als Punktgeometrie (Point)",
    "description": "CO2-Quellen in den Landkreisen Prignitz und Ostprignitz-Ruppin",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreise Prignitz und Ostprignitz-Ruppin",
        "resolution": "none"},
    "temporal": 
        {"reference_date": "none",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [{"name": "Anna Seefried", "description": "Creation", "url": "", "license": "", "copyright": ""} ],
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
        {"name": "environment.windnode_ptg_prignitz",
        "format": "PostgreSQL",
        "fields": [
            {"name": "source ", "description": "Quelle", "unit": ""},
            {"name": "typ", "description": "Typ", "unit": ""},
            {"name": "area", "description": "Fläche", "unit": "Quadratmeter"}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.windnode_ptg_prignitz' ::regclass) ::json;
