-- metadata
COMMENT ON TABLE supply.ego_dp_biomass_powerplant_prignitz IS '{
    "title": "Biomasseanlagen in der Untersuchungsregion Prignitz",
    "description": "Liste der Biomasseanlagen in der Untersuchungsregion Prignitz des eGo-Projekts",
    "language": [ "eng", "ger" ],
    "spatial": 
        {"location": "Landkreise Prignitz und Ostprignitz-Ruppin",
        "extent": "Europe",
        "resolution": "100m"},
    "temporal": 
        {"reference_date": "2016-01-01",
        "start": "1900-01-01",
        "end": "2049-12-31",
        "resolution": ""},
    "sources": [
        {"name": "eGo data processing", 
        "description": "Scripts with allocate Geometry by OpenStreetMap Objects or create future scenarios by high resolution geo-allocation", 
        "url": "https://github.com/openego/data_processing", 
        "license": "GNU Affero General Public License Version 3 (AGPL-3.0)", 
        "copyright": "© ZNES Europa-Universität Flensburg"},
        {"name": "EnergyMap.info ", 
        "description": "Data provider how collects and clean TSO and DSO data of Germany", 
        "url": "http://www.energymap.info/download.html", 
        "license": "unknown ", 
        "copyright": "Deutsche Gesellschaft für Sonnenenergie e.V."},
        {"name": "Bundesnetzagentur (BNetzA)", 
        "description": "The Federal Network Agency for Electricity, Gas, Telecommunications, Posts and Railway Data is in Germany data provider of power plant", 
        "url": "https://www.bundesnetzagentur.de/DE/Sachgebiete/ElektrizitaetundGas/Unternehmen_Institutionen/ErneuerbareEnergien/Anlagenregister/Anlagenregister_Veroeffentlichung/Anlagenregister_Veroeffentlichungen_node.html", 
        "license": "Creative Commons Namensnennung-Keine Bearbeitung 3.0 Deutschland Lizenz", 
        "copyright": "© Bundesnetzagentur für Elektrizität, Gas, Telekommunikation, Post und Eisenbahnen; Pressestelle"}
        {"name": "Deutsche Gesellschaft für Sonnenenergie e.V. DGS", "description": "Energy Map - Daten zur durchschnittlichen jährlichen Stromproduktion und zur Stromproduktion 2013", "url": "http://www.energymap.info/download.html", "license": "", "copyright": ""},
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Wasser. (08.06.2017)", "description": "Die Daten umfassen die Standorte und Einleitstellen der kommunalen Kläranlagen des Landes Brandenburg (digitalisiert), sowie die Erhebung bei den Aufgabenträgern der Abwasserentsorgung (Gemeinden, Abwasserzweckverbänden)", "url": "https://metaver.de/search/dls/#?serviceId=365B64CD-55CA-4C65-8F48-8B93B9C06E40&datasetId=4266D9C1-D20B-4922-B8B2-6BA116243CCE", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."} ],
    "license": 
        {"id": "ODbL-1.0",
        "name": "Open Data Commons Open Database License 1.0",
        "version": "1.0",
        "url": "https://opendatacommons.org/licenses/odbl/1.0/",
        "instruction": "You are free: To Share, To Create, To Adapt; As long as you: Attribute, Share-Alike, Keep open!",
        "copyright": "© ZNES Europa-Universität Flensburg"},
    "contributors": [
    {"name": "wolfbunke", "email": " ", 
    "date": "01.06.2017", "comment": "Create and restructure scripts and table"}],
    "resources": [
    {"name": "model_draft.ego_dp_supply_res_powerplant", 
    "format": "PostgreSQL",
    "fields": [
        {"name": "version", "description": "version number of eGo data processing", "unit": "" },
        {"name": "id", "description": "Unique identifier", "unit": "" },
        {"name": "start_up_date", "description": "start_up date of unit", "unit": "" },
        {"name": "electrical_capacity", "description": "electrical capacity", "unit": "kW" },
        {"name": "generation_type", "description": "generation_type or main fuel type", "unit": "" },
        {"name": "generation_subtype", "description": "generation subtype", "unit": "" },
        {"name": "thermal_capacity", "description": "", "unit": "kW" },
        {"name": "city", "description": "Name of city or location", "unit": "" },
        {"name": "postcode", "description": "postcode", "unit": "" },
        {"name": "address", "description": "address", "unit": "" },
        {"name": "lon", "description": "longitude", "unit": "" },
        {"name": "lat", "description": "latitude", "unit": "" },
        {"name": "gps_accuracy", "description": "gps accuracy in meter", "unit": "" },
        {"name": "validation", "description": "validation comments", "unit": "" },
        {"name": "notification_reason", "description": "notification reason from BNetzA sources", "unit": "" },
        {"name": "eeg_id", "description": "EEG id of Unit", "unit": "" },
        {"name": "tso", "description": "Name of Transmission system operator", "unit": "" },
        {"name": "tso_eic", "description": "Name of Transmission system operator", "unit": "" },
        {"name": "dso_id", "description": "Name of District system operator", "unit": "" },
        {"name": "dso", "description": "Name of District system operator", "unit": "" },
        {"name": "voltage_level_var", "description": "German voltage level ", "unit": "" },
        {"name": "network_node", "description": "Name or code of network node", "unit": "" },
        {"name": "power_plant_id", "description": "Power plant id from BNetzA", "unit": "" },
        {"name": "source", "description": "Short Name of source: energymap or bnetza", "unit": "" },
        {"name": "comment", "description": "Further comment of changes", "unit": "" },
        {"name": "geom", "description": "Geometry", "unit": "" },
        {"name": "subst_id", "description": "Unique identifier of related substation", "unit": "" },
        {"name": "otg_id", "description": "Unique identifier of related substation from osmTGmod", "unit": "" },
        {"name": "un_id", "description": "Unique identifier of RES and CONV power plants", "unit": "" },
        {"name": "voltage_level", "description": "voltage level as number code", "unit": "" },
        {"name": "la_id", "description": "Unique identifier of related .... ???", "unit": "" }, 
        {"name": "mvlv_subst_id", "description": "Unique identifier of related ... ???", "unit": "" },
        {"name": "rea_sort", "description": "res sort entry", "unit": "" },
        {"name": "rea_flag", "description": "Flag comment of rea method", "unit": "" },
        {"name": "rea_geom_line", "description": "Geometry line between original and processed data", "unit": "" },
        {"name": "rea_geom_new", "description": "Geometry of new position", "unit": "" }, 
        {"name": "preversion", "description": "preversion number of eGo data preprocessing", "unit": "" }, 
        {"name": "scenario", "description": "Name of scenario", "unit": "" },
        {"name": "flag", "description": "Flag of scenario changes of an power plant unit (repowering, decommission or commissioning).", "unit": "" },
        {"name": "nuts", "description": "NUTS ID", "unit": "" }, 
        {"name": "kwh_2013", "description": "Electricity production in 2013", "unit": "kWh"},
        {"name": "kwh_average", "description": "Average electricity production", "unit": "kwh"}
        {"name": "ew_wert", "description": "Einwohnerwert", "unit": ""}
    ] } ], 
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('supply.ego_dp_biomass_powerplant_prignitz' ::regclass) ::json;
