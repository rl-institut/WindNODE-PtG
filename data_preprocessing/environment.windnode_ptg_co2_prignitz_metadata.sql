-- metadata
COMMENT ON TABLE environment.windnode_ptg_co2_prignitz IS '{
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
        {"name": "environment.windnode_ptg_co2_prignitz",
        "format": "PostgreSQL",
        "fields": [
            {"name": "electrical_capacity ", "description": "Elektrische Leistung der Anlage", "unit": "Kilowatt"},
            {"name": "kWh_2013", "description": "Stromproduktion im Jahr 2013", "unit": "Kilowattstunden"},
            {"name": "kWh_average", "description": "Durchschnittliche jährliche Stromproduktion", "unit": "Kilowattstunden"},
            {"name": "ew_wert", "description": "Einwohnerwert Kläranlage", "unit": ""},
            {"name": "generation_type", "description": "Anlagentyp", "unit": ""},
            {"name": "generation_subtype", "description": "Anlagenuntertyp", "unit": ""},
            {"name": "city", "description": "Stadt", "unit": ""},
            {"name": "postcode", "description": "Postleitzahl", "unit": ""},
            {"name": "address", "description": "Adresse", "unit": ""},
            {"name": "source", "description": "Quelle", "unit": ""},
            {"name": "comment", "description": "Kommentar", "unit": ""},
            {"name": "in_area_res", "description": "Befindet sich die Anlage in einem restriktiven Gebiet?", "unit": ""},
            {"name": "in_area_res", "description": "Befindet sich die Anlage in einem 5km Radius zum Gasnetz?", "unit": ""},
            {"name": "in_area_sel_ee", "description": "Befindet sich die Anlage in einem 1km Radius zu EE-Erzeugungsanlagen?", "unit": ""},
            {"name": "v_co2", "description": "CO2-Volumen", "unit": "Kubikmeter"},
            {"name": "p_ptg_2500", "description": "Power to Gas Leistung bei 2500 Volllaststunden", "unit": "Kilowatt"},
            {"name": "p_ptg_4000", "description": "Power to Gas Leistung bei 4000 Volllaststunden", "unit": "Kilowatt"},
            {"name": "p_ptg_5500 ", "description": "Power to Gas Leistung bei 5500 Volllaststunden", "unit": "Kilowatt"}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.windnode_ptg_co2_prignitz' ::regclass) ::json;
