-- metadata
COMMENT ON TABLE economy.uba_industry_prignitz IS '{
    "title": "Emissionshandelspflichtige Anlagen in Deutschland 2016",
    "description": " Liste der emissionshandelspflichtigen, stationären Anlagen in Deutschland",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreise Prignitz und Ostprignitz-Ruppin",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2017-05-02",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Umweltbundesamt - DEHSt", "description": " Liste der emissionshandelspflichtigen, stationären Anlagen in Deutschland ", "url": "https://www.dehst.de/SharedDocs/downloads/DE/anlagenlisten/2016.pdf?__blob=publicationFile&v=3", "license": "", "copyright": ""},
        {"name": "Anna Seefried", "description": "Digitalization and Georeferencing", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "",
        "copyright": "tba"},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-08-28", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "economy.uba_industry_prignitz",
        "format": "PostgreSQL",
        "fields": [
            {"name": "id", "description": "Identifikationsschlüssel", "unit": ""},
            {"name": "betreiber", "description": "", "unit": ""},
            {"name": "anlagennam", "description": "Anlagenname", "unit": ""},
            {"name": "Stadt", "description": "", "unit": ""},
            {"name": "haupttäti", "description": "Haupttätigkeit nach TEHG", "unit": ""},
            {"name": "Quelle", "description": "", "unit": ""},
            {"name": "co2_2015", "description": "CO2-Emissionen 2015", "unit": "m3"},
            {"name": "kommentar", "description": "Standortverifizierung, x steht für verifiziert", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('economy.uba_industry_prignitz' ::regclass) ::json;
