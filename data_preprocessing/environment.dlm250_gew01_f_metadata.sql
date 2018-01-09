-- metadata
COMMENT ON TABLE environment.dlm250_gew01_f IS '{
    "title": "Digitales Landschaftsmodell 1:250 000 - Gewässer, dargestellt durch flächenhafte Objekte",
    "description": "Das Digitale Landschaftsmodell 1:250 000 (DLM250) beschreibt die topographischen Objekte der Landschaft im Vektorformat. Die Objekte werden einer bestimmten Objektart zugeordnet und durch ihre räumliche Lage, ihren geometrischen Typ und beschreibende Attribute definiert.",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreise Prignitz und Ostprignitz-Ruppin",
        "resolution": "none"},
    "temporal":
        {"reference_date": "2015-12-31",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Dienstleistungszentrum des Bundes für Geoinformation und Geodäsie", "description": "none", "url": "http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=1&gdz_user_id=0#dok", "license": "http://www.geodatenzentrum.de/docpdf/geonutzv_deu.pdf", "copyright": "© GeoBasis - DE / BKG 2017"},
        {"name": "Übersicht über den Datenbestand", "description": "Dokumentation des Datenbestands", "url": "https://sg.geodatenzentrum.de/web_download/dlm/dlm250/dlm250.pdf", "license": "none", "copyright": "none"} ],
    "license":
        {"id": "geonutzv-de-2013-03-19",
        "name": "GeoNutzV",
        "version": "2013-03-19",
        "url": "https://www.geodatenzentrum.de/docpdf/geonutzv.pdf",
        "instruction":  "Geodaten und Geodatendienste, einschließlich zugehöriger Metadaten, werden für alle derzeit bekannten sowie für alle zukünftig bekannten Zwecke kommerzieller und nicht kommerzieller Nutzung geldleistungsfrei zur Verfügung gestellt, soweit durch besondere Rechtsvorschrift nichts anderes bestimmt ist oder vertragliche oder gesetzliche Rechte Dritter dem nicht entgegenstehen.",
        "copyright": "© GeoBasis - DE / BKG 2017"},
    "contributors": [
        {"name": "KilianZimmerer", "email": "", "date": "2017-11-08", "comment": "create metadata"} ],
    "resources": [
        {"name": "environment.dlm250_gew01_f",
        "format": "PostgreSQL",
        "fields": [
            {"name": "id", "description": "Unique identifier", "unit": "none" },
            {"name": "year", "description": "Reference year", "unit": "none" },
            {"name": "land", "description": "Landeskennung", "unit": "none" },
            {"name": "modellart", "description": "Modellartenkennung", "unit": "none" },
            {"name": "objart", "description": "Objektart", "unit": "none" },
            {"name": "objart_txt", "description": "Objektart Text", "unit": "none" },
            {"name": "objid", "description": "eindeutiger Objektidentifikator", "unit": "none" },
            {"name": "hdu_x", "description": "Unterführungsbeziehung", "unit": "none" },
            {"name": "beginn", "description": "Lebenszeitintervall beginnt", "unit": "none" },
            {"name": "ende", "description": "Lebenszeitintervall endet", "unit": "none" },
            {"name": "objart_z", "description": "Objektart des ZUSO", "unit": "none" },
            {"name": "objid_z", "description": "Objekt-ID des ZUSO", "unit": "none" },
            {"name": "fkt", "description": "Funktion", "unit": "none" },
            {"name": "gwk", "description": "Gewässerkennzahl", "unit": "none" },
            {"name": "hyd", "description": "hydrologisches Merkmal", "unit": "none" },
            {"name": "nam", "description": "Name", "unit": "none" },
            {"name": "rgs", "description": "Regionalsprache", "unit": "none" },
            {"name": "sfk", "description": "Schifffahrtskategorie", "unit": "none" },
            {"name": "skz", "description": "Seekennzahl", "unit": "none" },
            {"name": "wdm", "description": "Widmung", "unit": "none" },
            {"name": "znm", "description": "Zweitname", "unit": "none" },
            {"name": "zus", "description": "Zustand", "unit": "none" },
            {"name": "bemerkung", "description": "Bemerkung", "unit": "none" },
            {"name": "geom", "description": "Geometry", "unit": "none" }] }],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.dlm250_gew01_f' ::regclass) ::json;
