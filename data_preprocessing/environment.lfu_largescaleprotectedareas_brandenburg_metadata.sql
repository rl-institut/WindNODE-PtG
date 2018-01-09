-- metadata
COMMENT ON TABLE environment.lfu_largescaleprotectedareas_brandenburg IS '{
    "title": " Großchutzgebiete des Landes Brandenburg als Polygongeometrie (MultiPolygon)",
    "description": "Der Datenbestand umfasst die Großschutzgebiete nach Naturschutzrecht des Landes Brandenburg.",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Brandenburg",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2017-05-15",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landwirtschafts- und Umweltinformationssystem des Landes Brandenburg (LUIS-BB) zum Thema Naturschutz. (20.03.2017) ", "description": "Der Datenbestand umfasst die Großschutzgebiete nach Naturschutzrecht des Landes Brandenburg.", "url": "https://metaver.de/search/dls/#?serviceId=AC198EC3-DAE6-4F8F-9FF6-62375FCEF7C6&datasetId=AB2F53A4-A68E-413F-84C4-A972D2A2DA0B", "license": "Datenlizenz Deutschland - Namensnennung", "copyright": "© Landesbetrieb Geoinformation und Vermessung. Alle Rechte vorbehalten."},
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
        {"name": "environment.lfu_largescaleprotectedareas_brandenburg",
        "format": "PostgreSQL",
        "fields": [
            {"name": "dissolve_i", "description": "Datenbankschlüssel für die Interne Geodatenverarbeitung", "unit": ""},
            {"name": "fl_id", "description": "Ident für den Geltungsbereich einer Schutzanordnung innerhalb der Grenze eines Schutzgebietes (Datenbankschlüssel)", "unit": ""},
            {"name": "typ_kurz", "description": "Abkürzung für den Schutzgebietstyp", "unit": ""},
            {"name": "typ", "description": "Langbezeichnung des Schutzgebietstyp", "unit": ""},
            {"name": "sfl_id", "description": "Ident für die Unterteilung, Zonierung (Zone 1, 2,...; Naturentwicklungsgebiete; Totalreservate; Einwirkungszonen; Pufferflächen etc.) einer Schutzgebietsfläche entsprechend den Regelungen der jeweiligen Schutzanordnung (=Auflagengebiet) (Datenbankschlüssel)", "unit": ""},
            {"name": "flaechenty", "description": "Bezeichnung einer Schutzgebietsteilfläche, -zone, Langschrift der SFL_ID", "unit": ""},
            {"name": "gebiet_id", "description": "Schlüsselnummer eines Schutzgebietes", "unit": ""},
            {"name": "isn", "description": "Identifikationsschlüsselnummer; Registraturschlüssel im Schutzgebietsarchiv", "unit": ""},
            {"name": "schutzstat", "description": "Bezeichner für den Schutzstatus einer Schutzgebietsfläche", "unit": ""},
            {"name": "sg_name", "description": "Bezeichnung der Schutzgebietsfläche lt. Schutzanordnung", "unit": ""},
            {"name": "schutzanor", "description": "Schutzanordnung; Rechtsakt, der Unterschutzstellung", "unit": ""},
            {"name": "inkrafttre", "description": "Datum des Inkrafttretens der Schutzanordnung", "unit": ""},
            {"name": "bekanntmac", "description": "Publikation der Bekanntmachung der Schutzanordnung", "unit": ""},
            {"name": "flaeche", "description": "Flächengröße in ha einer Teilfläche; bezieht sich auf die Gesamtfläche des jeweiligen Zonierungstyps innerhalb des Geltungsbereiches der Schutzanordnung und nicht auf das einzelne Polygon (d.h. beinhaltet ein NSG z.B. mehrere räumlich nicht zusammenhängende Totalreservate, so wird jeweils die Summe aller Einzelflächen ausgegeben).", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lfu_largescaleprotectedareas_brandenburg' ::regclass) ::json;
