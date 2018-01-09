-- metadata
COMMENT ON TABLE supply.ego_dp_conv_powerplant_prignitz IS '{
    "title": "Konventionelle Kraftwerke in der Untersuchungsregion Prignitz",
    "description": "Liste der konventionellen Kraftwerke in der Untersuchungsregion Prignitz des eGo-Projekts.",
    "language": [ "eng", "ger" ],
    "spatial": 
    {"location": "Landkreise Prignitz und Ostprignitz-Ruppin",
    "extent": "europe",
    "resolution": "100 m"},
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

    {"name": "Open Power System Data (OPSD)",
    "url": "http://data.open-power-system-data.org/conventional_power_plants/2016-02-08/",
    "license": "Creative Commons Attribution 4.0 International", 
    "copyright": "© Open Power System Data. 2017"}, 

    {"name": "Bundesnetzagentur (BNetzA)", 
    "description": "The Federal Network Agency for Electricity, Gas, Telecommunications, Posts and Railway Data is in Germany data provider of power plant", 
    "url": "https://www.bundesnetzagentur.de/DE/Sachgebiete/ElektrizitaetundGas/Unternehmen_Institutionen/ErneuerbareEnergien/Anlagenregister/Anlagenregister_Veroeffentlichung/Anlagenregister_Veroeffentlichungen_node.html", 
    "license": "Creative Commons Namensnennung-Keine Bearbeitung 3.0 Deutschland Lizenz", 
    "copyright": "© Bundesnetzagentur für Elektrizität, Gas, Telekommunikation, Post und Eisenbahnen; Pressestelle"}
    ],
    "license": 
    {"id": "ODbL-1.0",
    "name": "Open Data Commons Open Database License 1.0",
    "version": "1.0",
    "url": "https://opendatacommons.org/licenses/odbl/1.0/",
    "instruction": "You are free: To Share, To Create, To Adapt; As long as you: Attribute, Share-Alike, Keep open!",
    "copyright": "© ZNES Europa-Universität Flensburg"},
    "contributors": [
    {"name": "wolfbunke", "email": " ", "date": "01.06.2017", "comment": "Create and restructure scripts and table"}],
    "resources": [
    {"name": "model_draft.ego_dp_supply_conv_powerplant", 
    "format": "PostgreSQL",
    "fields": [
    {"name": "version", "description": "version number of eGo data processing", "unit": "" },
    {"name": "gid", "description": "Unique identifier", "unit": "" },
    {"name": "bnetza_id", "description": "Bundesnetzagentur unit ID", "unit": " " }, 
    {"name": "company", "description": "Name of company", "unit": " " }, 
    {"name": "name", "description": "name of unit ", "unit": " " }, 
    {"name": "postcode", "description": "postcode ", "unit": " " }, 
    {"name": "city", "description": "Name of City", "unit": " " }, 
    {"name": "street", "description": "Street name, address", "unit": " " }, 
    {"name": "state", "description": "Name of federate state of location", "unit": " " }, 
    {"name": "block", "description": "Power plant block", "unit": " " }, 
    {"name": "commissioned_original", "description": "Year of commissioning (raw data)", "unit": " " }, 
    {"name": "commissioned", "description": "Year of commissioning", "unit": " " }, 
    {"name": "retrofit", "description": "Year of modernization according to UBA data", "unit": " " }, 
    {"name": "shutdown", "description": "Year of decommissioning", "unit": " " }, 
    {"name": "status", "description": "Power plant status", "unit": " " }, 
    {"name": "fuel", "description": "Used fuel or energy source", "unit": " " }, 
    {"name": "technology", "description": "Power plant technology or sort", "unit": " " }, 
    {"name": "type", "description": "Purpose of the produced power", "unit": " " }, 
    {"name": "eeg", "description": "Status of being entitled to a renumeration", "unit": " " }, 
    {"name": "chp", "description": "Status of being able to supply heat", "unit": " " }, 
    {"name": "capacity", "description": "Power capacity", "unit": " " }, 
    {"name": "capacity_uba", "description": "Power capacity according to UBA data", "unit": " " },
    {"name": "chp_capacity_uba", "description": "Heat capacity according to UBA data", "unit": " " }, 
    {"name": "efficiency_data", "description": "Proportion between power output and input", "unit": " " }, 
    {"name": "efficiency_estimate", "description": "Estimated proportion between power output and input", "unit": " " },
    {"name": "network_node", "description": "Connection point to the electricity grid", "unit": " " },
    {"name": "voltage", "description": "Grid or transformation level of the network node", "unit": " " },
    {"name": "network_operator", "description": "Network operator of the grid or transformation level", "unit": " " },
    {"name": "name_uba", "description": "Power plant name according to UBA data", "unit": " " },
    {"name": "lat", "description": "Precise geographic coordinates - latitude", "unit": " " },
    {"name": "lon", "description": "Precise geographic coordinates - longitude", "unit": " " },
    {"name": "comment", "description": "Further comments", "unit": " " },
    {"name": "geom", "description": "Geometry Point", "unit": " " },
    {"name": "voltage_level", "description": " ", "unit": " " },
    {"name": "subst_id", "description": "Unique identifier of related substation", "unit": "" },
    {"name": "otg_id", "description": "Unique identifier of related substation from osmTGmod", "unit": "" },
    {"name": "un_id", "description": "Unique identifier of RES and CONV power plants", "unit": "" },
    {"name": "la_id", "description": "Unique identifier of RES and CONV power plants", "unit": "" }, 
    {"name": "scenario", "description": "Name of scenario", "unit": "" },
    {"name": "preversion", "description": "Preversion ID of eGo data preprocessing", "unit": "" },
    {"name": "flag", "description": "Flag of scenario changes of an power plant unit (repowering, decommission or commissioning).", "unit": "" },
    {"name": "nuts", "description": "NUTS ID", "unit": ""} ] } ],
    "meta_version": "1.3" } 
    ';

-- select description
SELECT obj_description('supply.ego_dp_conv_powerplant_prignitz' ::regclass) ::json;