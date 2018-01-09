-- metadata
COMMENT ON TABLE environment.lkpr_protectedavenues_lkprignitz IS '{
    "title": "Gesetzlich geschützte Alleen an Kreisstraßen des Landkreises Prignitz als Liniengeometrie (MultiLineString)",
    "description": "Alleen sind beidseitige Gehölzreihen entlang von Verkehrswegen, die hinsichtlich Anzahl und Anordnung bestimmten Kriterien unterliegen. Alleen dürfen nicht beseitigt, zerstört, beschädigt oder sonst erheblich oder nachhaltig beeinträchtigt werden (§ 31 BbgNatSchG).",
    "language": [ "ger" ],
    "spatial": 
        {"location": "none",
        "extent": "Landkreis Prignitz",
        "resolution": "vector"},
    "temporal": 
        {"reference_date": "2016-07-01",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "sources": [
        {"name": "Landeskreis Prignitz, Untere Naturschutzbehörde Sb Natur- und Gewässerschutz, Frau Schneider und Frau Schmidt(Kreismeisterin)", "description": "Alleen sind beidseitige Gehölzreihen entlang von Verkehrswegen, die hinsichtlich Anzahl und Anordnung bestimmten Kriterien unterliegen. Alleen dürfen nicht beseitigt, zerstört, beschädigt oder sonst erheblich oder nachhaltig beeinträchtigt werden (§ 31 BbgNatSchG).", "url": "", "license": "", "copyright": ""},
        {"name": "", "description": "", "url": "", "license": "", "copyright": ""} ],
    "license": 
        {"id": "",
        "name": "",
        "version": "",
        "url": "",
        "instruction": "Verwendung in der Masterarbeit unter Angabe des Quellenvermerkes (Landkreis Prignitz), Eine Weitergabe oder Veröffentlichung der Daten über den Projektzweck hinaus ist nicht gestattet.",
        "copyright": "Landkreis Prignitz"},
    "contributors": [
        {"name": "Anna Seefried", "email": "", "date": "2017-07-27", "comment": "Create metadata"},
        {"name": "", "email": "", "date": "", "comment": ""} ],
    "resources": [
        {"name": "environment.lkpr_protectedavenues_lkprignitz",
        "format": "PostgreSQL",
        "fields": [
            {"name": "str_name", "description": "", "unit": ""},
            {"name": "abschnitt", "description": "", "unit": ""},
            {"name": "von_km", "description": "", "unit": ""},
            {"name": "bis_km", "description": "", "unit": ""},
            {"name": "strid", "description": "", "unit": ""},
            {"name": "shape_sytle", "description": "", "unit": ""}]}],
    "metadata_version": "1.3"}';

-- select description
SELECT obj_description('environment.lkpr_protectedavenues_lkprignitz' ::regclass) ::json;
