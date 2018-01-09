-- metadata
COMMENT ON TABLE supply.bnetza_biomass_powerplant_prignitz IS '{
    "title": "Zusätzliche Biomasseanlagen in der Untersuchungsregion ABW auf Basis des Anlagenregisters der BNetzA",
    "description": "",
    "language": [ "eng" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreise Anhalt-Bittefeld, Wittenberg und kreisfreie Stadt Dessau-Roßlau",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Bundesnetzagentur", "description": "Veröffentlichung Anlagenregister August 2014 bis Juni 2017", "url": "https://www.bundesnetzagentur.de/DE/Sachgebiete/ElektrizitaetundGas/Unternehmen_Institutionen/ErneuerbareEnergien/Anlagenregister/Anlagenregister_Veroeffentlichung/Anlagenregister_Veroeffentlichungen_node.html", "license": "", "copyright": ""},
        {"name": "Deutsche Gesellschaft für Sonnenenergie e.V. DGS", "description": "Energy Map - Daten zur durchschnittlichen jährlichen Stromproduktion und zur Stromproduktion 2013", "url": "http://www.energymap.info/download.html", "license": "", "copyright": ""},
        {"name": "Anna Seefried", "description": "Digitalization and Georeferencing", "url": "", "license": "", "copyright": ""}],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "",
        "copyright": "tba"},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-08-26", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "supply.bnetza_biomass_powerplant_prignitz",
        "format": "PostgreSQL",
        "fields": [
            {"name": "id", "description": "Identifikationsschlüssel", "unit": ""},
            {"name": "inbetriebn", "description": "Datum der tatsächlichen Inbetriebname", "unit": ""},
            {"name": "leistung_el", "description": "Elektrische Leistung", "unit": "kw"},
            {"name": "energietraeger", "description": "", "unit": "kw"},
            {"name": "energietraeger_1", "description": "Untertyp des Energieträgers", "unit": ""},
            {"name": "fwl", "description": "Fernwärmleistung", "unit": ""},
            {"name": "stadt", "description": "", "unit": ""},
            {"name": "plz", "description": "", "unit": ""},
            {"name": "adresse", "description": "", "unit": ""},
            {"name": "Quelle", "description": "", "unit": ""},
            {"name": "kwh_2013", "description": "Stromproduktion in 2013", "unit": "kWh"},
            {"name": "kwh_average", "description": "durchschnittliche jährliche Stromproduktion", "unit": "kWh"},
            {"name": "kommentar", "description": "Standortverifizierung, x steht für verifiziert", "unit": ""}]}],
    "metadata_version": "1.3"}';


-- select description
SELECT obj_description('supply.bnetza_biomass_powerplant_prignitz' ::regclass) ::json;
