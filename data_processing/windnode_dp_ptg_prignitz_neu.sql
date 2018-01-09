/*
This script calculates the geographic potential of Power to Gas in the study region "Prignitz" in Germany

__title__           = "WindNODE Dataprocessing PTG Prignitz"
__date__            = "2017-12-06"
__author__          = "Anna Seefried, Ludwig Hülk"
__copyright__       = "© Reiner Lemoine Institut"
__license__         = "GNU Affero General Public License Version 3 (AGPL-3.0)"
__license_url__     = "https://www.gnu.org/licenses/agpl-3.0.de.html"
__instructions__    = "You are free to Share and Adapt as long as you Attribute, Include License, State Changes, Disclose Source, Share Alike under same license and don't add additional restrictions"
__citation__        = "WindNODE Dataprocessing PTG Prignitz © Reiner Lemoine Institut | AGPL-3.0"
__contains__        = "DOI:j.est.2015.03.001"


-- export from oedb database
-- grants & indices
-- set SRIDs
-- create restrictive areas
-- calculate study region area and restrictive area in study region
-- create selective areas
-- optional: calculate PV and wind capacity
-- identify suitable CO2-sources
-- calculate CO2-potential
-- optional: calculate shortest distance CO2-source to gas grid

Additional information:
Duration approximately 15 minutes

*/


-- export from oedb database

--create materialized view for prignitz region (districts)
DROP MATERIALIZED VIEW IF EXISTS    boundaries.bkg_vg250_4_krs_prignitz_mview CASCADE;
CREATE MATERIALIZED VIEW         boundaries.bkg_vg250_4_krs_prignitz_mview AS
    SELECT gen,    
    id,ST_TRANSFORM(geom,3035) ::geometry(MultiPolygon,3035) AS geom
    FROM    boundaries.bkg_vg250_4_krs
    WHERE    id = 3 OR id = 8;

--extract biomass powerplants
DROP TABLE IF EXISTS     supply.ego_dp_biomass_powerplant_prignitz;
CREATE TABLE         supply.ego_dp_biomass_powerplant_prignitz AS
    SELECT     res.*
    FROM     supply.ego_dp_res_powerplant AS res,
        boundaries.bkg_vg250_4_krs_prignitz_mview AS vg
    WHERE     ST_TRANSFORM(vg.geom,3035) && ST_TRANSFORM(res.geom,3035) AND
        ST_CONTAINS(ST_TRANSFORM(vg.geom,3035),ST_TRANSFORM(res.geom,3035)) AND
        (res.generation_type = 'biomass' OR res.generation_type = 'gas');
        
-- grant (oeuser)
ALTER TABLE supply.ego_dp_biomass_powerplant_prignitz OWNER TO oeuser;

-- index GIST (geom)
CREATE INDEX ego_dp_biomass_powerplant_prignitz_geom_idx 
    ON model_draft.ego_dp_biomass_powerplant_prignitz USING gist (geom);
    
--extract wind and pv powerplants
DROP TABLE IF EXISTS     supply.ego_dp_ee_powerplant_prignitz;
CREATE TABLE             supply.ego_dp_ee_powerplant_prignitz AS
    SELECT     res.*
    FROM     supply.ego_dp_res_powerplant AS res,
        boundaries.bkg_vg250_4_krs_prignitz_mview AS vg
    WHERE     ST_TRANSFORM(vg.geom,3035) && ST_TRANSFORM(res.geom,3035) AND
            ST_CONTAINS(ST_TRANSFORM(vg.geom,3035),ST_TRANSFORM(res.geom,3035)) AND
            (res.generation_type = 'wind' OR res.generation_type = 'solar');
            
-- grant (oeuser)
ALTER TABLE supply.ego_dp_ee_powerplant_prignitz OWNER TO oeuser;

-- index GIST (geom)
CREATE INDEX ego_dp_ee_powerplant_prignitz_geom_idx 
    ON supply.ego_dp_ee_powerplant_prignitz USING gist (geom);

-- drop materialized view for study region
DROP MATERIALIZED VIEW IF EXISTS    boundaries.bkg_vg250_4_krs_prignitz_mview CASCADE;
    
--extract conventional powerplants
DROP TABLE IF EXISTS     supply.ego_dp_conv_powerplant_prignitz;
CREATE TABLE             supply.ego_dp_conv_powerplant_prignitz AS
    SELECT     res.*
    FROM     supply.ego_dp_conv_powerplant AS res,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     res.version = 'v0.2.10' AND
            (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(vg.geom,3035) && ST_TRANSFORM(res.geom,3035) AND
            ST_CONTAINS(ST_TRANSFORM(vg.geom,3035),ST_TRANSFORM(res.geom,3035));
    
-- extract already used areas (water bodies type 01)
DROP TABLE IF EXISTS     orig_geo_dlm250.dlm250_gew01_f_prignitz;
CREATE TABLE             orig_geo_dlm250.dlm250_gew01_f_prignitz AS
    SELECT     g.gid,
    g.nam,
    ST_INTERSECTION(ST_TRANSFORM(g.geom, 3035), ST_TRANSFORM(vg.geom, 3035)) AS geom
    FROM     orig_geo_dlm250.dlm250_gew01_f AS g,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(g.geom,3035) && ST_TRANSFORM(vg.geom,3035);
            
-- extract already used areas (settlement areas type 02)            
DROP TABLE IF EXISTS     orig_geo_dlm250.dlm250_sie02_f_prignitz;
CREATE TABLE             orig_geo_dlm250.dlm250_sie02_f_prignitz AS
    SELECT     g.gid,
    g.objart_txt,
    g.nam,
    ST_INTERSECTION(ST_TRANSFORM(g.geom, 3035), ST_TRANSFORM(vg.geom, 3035)) AS geom
    FROM     orig_geo_dlm250.dlm250_sie02_f AS g,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(g.geom,3035) && ST_TRANSFORM(vg.geom,3035);            

-- extract already used areas (vegetation areas type 02)            
DROP TABLE IF EXISTS     orig_geo_dlm250.dlm250_veg02_f_prignitz;
CREATE TABLE             orig_geo_dlm250.dlm250_veg02_f_prignitz AS
    SELECT     g.gid,
    g.nam,
    ST_INTERSECTION(ST_TRANSFORM(g.geom, 3035), ST_TRANSFORM(vg.geom, 3035)) AS geom
    FROM     orig_geo_dlm250.dlm250_veg02_f AS g,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(g.geom,3035) && ST_TRANSFORM(vg.geom,3035);

-- extract already used areas (vegetation areas type 03)            
DROP TABLE IF EXISTS     orig_geo_dlm250.dlm250_veg03_f_prignitz;
CREATE TABLE             orig_geo_dlm250.dlm250_veg03_f_prignitz AS
    SELECT         g.gid,
    g.nam,
    ST_INTERSECTION(ST_TRANSFORM(g.geom, 3035), ST_TRANSFORM(vg.geom, 3035)) AS geom
    FROM     orig_geo_dlm250.dlm250_veg03_f AS g,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(g.geom,3035) && ST_TRANSFORM(vg.geom,3035);    

-- extract already used areas (vegetation areas type 04)
DROP TABLE IF EXISTS     orig_geo_dlm250.dlm250_veg04_f_prignitz;
CREATE TABLE             orig_geo_dlm250.dlm250_veg04_f_prignitz AS
    SELECT     g.gid,
    g.nam,
    ST_INTERSECTION(ST_TRANSFORM(g.geom, 3035), ST_TRANSFORM(vg.geom, 3035)) AS geom
    FROM     orig_geo_dlm250.dlm250_veg04_f AS g,
            boundaries.bkg_vg250_4_krs AS vg
    WHERE     (vg.id = 3 OR vg.id = 8) AND 
            ST_TRANSFORM(g.geom,3035) && ST_TRANSFORM(vg.geom,3035);                    

            
-- grants & indices

-- grant (rli_write)
ALTER TABLE environment.dlm250_gew01_l_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_gew01_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_sie01_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_sie02_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_sie03_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_sie04_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_veg01_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_veg02_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_veg03_f_prignitz OWNER TO rli_write;
ALTER TABLE environment.dlm250_veg04_f_prignitz OWNER TO rli_write;
ALTER TABLE supply.bnetza_biomass_powerplant_prignitz OWNER TO rli_write;
ALTER TABLE supply.lfu_chpplant_prignitz OWNER TO rli_write;
ALTER TABLE supply.ego_dp_biomass_powerplant_prignitz OWNER TO rli_write;
ALTER TABLE supply.ego_dp_ee_powerplant_prignitz OWNER TO rli_write;
ALTER TABLE supply.ego_dp_conv_powerplant_prignitz OWNER TO rli_write;
ALTER TABLE environment.lfu_naturereserves_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_largescaleprotectedareas_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_conservationareas_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lkpr_naturalmonuments_lkprignitz OWNER TO rli_write;
ALTER TABLE environment.lkopr_naturalmonuments_lkopr OWNER TO rli_write;
ALTER TABLE environment.lkpr_protectedavenues_lkprignitz OWNER TO rli_write;
ALTER TABLE environment.lfu_biotopes_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_ffhareas_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_birdsanctuaries_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_waterreserves_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_floodwaterretentionareas_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_municipalsewageplants_brandenburg OWNER TO rli_write;
ALTER TABLE environment.lfu_municipalsewageplants_brandenburg_fix OWNER TO rli_write;
ALTER TABLE economy.uba_industry_prignitz OWNER TO rli_write;

-- index GIST (geom)
CREATE INDEX dlm250_gew01_l_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);

CREATE INDEX dlm250_gew01_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_sie01_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);

CREATE INDEX dlm250_sie02_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_sie03_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_sie04_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_veg01_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_veg02_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_veg03_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);
    
CREATE INDEX dlm250_veg04_f_prignitz_geom_idx 
    ON environment.dlm250_gew01_l_prignitz USING gist (geom);

CREATE INDEX lfu_chpplant_prignitz_geom_idx 
    ON supply.lfu_chpplant_prignitz USING gist (geom);

CREATE INDEX bnetza_biomass_powerplant_prignitz_geom_idx 
    ON supply.bnetza_biomass_powerplant_prignitz USING gist (geom);

CREATE INDEX ego_dp_biomass_powerplant_prignitz_geom_idx 
    ON supply.ego_dp_biomass_powerplant_prignitz USING gist (geom);
    
CREATE INDEX ego_dp_ee_powerplant_prignitz_geom_idx 
    ON supply.ego_dp_ee_powerplant_prignitz USING gist (geom);
    
CREATE INDEX ego_dp_conv_powerplant_prignitz_geom_idx 
    ON supply.ego_dp_conv_powerplant_prignitz USING gist (geom);    

CREATE INDEX lfu_naturereserves_brandenburg_geom_idx 
    ON environment.lfu_naturereserves_brandenburg USING gist (geom);
    
CREATE INDEX lfu_largescaleprotectedareas_brandenburg_geom_idx 
    ON environment.lfu_largescaleprotectedareas_brandenburg USING gist (geom);    

CREATE INDEX lfu_conservationareas_brandenburg_geom_idx 
    ON environment.lfu_conservationareas_brandenburg USING gist (geom);    
    
CREATE INDEX lkpr_naturalmonuments_lkprignitz_geom_idx 
    ON environment.lkpr_naturalmonuments_lkprignitz USING gist (geom);    
    
CREATE INDEX lkopr_naturalmonuments_lkopr_geom_idx 
    ON environment.lkopr_naturalmonuments_lkopr USING gist (geom);        
    
CREATE INDEX lkpr_protectedavenues_lkprignitz_geom_idx 
    ON environment.lkpr_protectedavenues_lkprignitz USING gist (geom);        
    
CREATE INDEX lfu_biotopes_brandenburg_geom_idx 
    ON environment.lfu_biotopes_brandenburg USING gist (geom);            
    
CREATE INDEX lfu_ffhareas_brandenburg_geom_idx 
    ON environment.lfu_ffhareas_brandenburg USING gist (geom);
    
CREATE INDEX lfu_birdsanctuaries_brandenburg_geom_idx 
    ON environment.lfu_birdsanctuaries_brandenburg USING gist (geom);
    
CREATE INDEX lfu_waterreserves_brandenburg_geom_idx 
    ON environment.lfu_waterreserves_brandenburg USING gist (geom);
    
CREATE INDEX lfu_floodwaterretentionareas_brandenburg_geom_idx 
    ON environment.lfu_floodwaterretentionareas_brandenburg USING gist (geom);
    
CREATE INDEX lfu_municipalsewageplants_brandenburg_geom_idx 
    ON environment.lfu_municipalsewageplants_brandenburg USING gist (geom);    

CREATE INDEX lfu_municipalsewageplants_brandenburg_fix_geom_idx 
    ON environment.lfu_municipalsewageplants_brandenburg_fix USING gist (geom);    

CREATE INDEX uba_industry_prignitz_geom_idx 
    ON economy.uba_industry_prignitz USING gist (geom);    


-- set SRIDs

ALTER TABLE environment.lfu_naturereserves_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_largescaleprotectedareas_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_conservationareas_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);    
    
ALTER TABLE environment.lkpr_naturalmonuments_lkprignitz
    ALTER COLUMN geom TYPE geometry(Point,3006) USING ST_SetSRID(geom,3006);    

ALTER TABLE environment.lkopr_naturalmonuments_lkopr
    ALTER COLUMN geom TYPE geometry(Point,3006) USING ST_SetSRID(geom,3006);

ALTER TABLE environment.lkpr_protectedavenues_lkprignitz
    ALTER COLUMN geom TYPE geometry(MultiLineStringM,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_biotopes_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);    

ALTER TABLE environment.lfu_ffhareas_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_birdsanctuaries_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_waterreserves_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);
    
ALTER TABLE environment.lfu_floodwaterretentionareas_brandenburg
    ALTER COLUMN geom TYPE geometry(MultiPolygon,3006) USING ST_SetSRID(geom,3006);

ALTER TABLE environment.lfu_municipalsewageplants_brandenburg_fix
    ALTER COLUMN geom TYPE geometry(Point,3006) USING ST_SetSRID(geom,3006);

    
-- Insert restrictive areas

-- create table for insertion of restrictive areas

DROP TABLE IF EXISTS     environment.windnode_ptg_prignitz CASCADE;
CREATE TABLE         environment.windnode_ptg_prignitz (
    id    SERIAL,
    source    text,
    typ    text,
    area    double precision,
    geom    geometry(MultiPolygon,3035),
    CONSTRAINT windnode_ptg_prignitz_pkey PRIMARY KEY (id));

-- grant (rli_write)
ALTER TABLE environment.windnode_ptg_prignitz OWNER TO rli_write;

-- index GIST (geom)
CREATE INDEX windnode_ptg_prignitz_geom_idx 
    ON environment.windnode_ptg_prignitz USING gist (geom);

--create mview for prignitz region (districts)
DROP MATERIALIZED VIEW IF EXISTS    boundaries.vg250_4_krs_prignitz_mview CASCADE;
CREATE MATERIALIZED VIEW         boundaries.vg250_4_krs_prignitz_mview AS
    SELECT     gen,
    gid,
    ST_TRANSFORM(geom,3035) ::geometry(MultiPolygon,3035) AS geom
    FROM    boundaries.vg250_4_krs
    WHERE    gid = 3 OR gid = 8;

-- insert naturereserves
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_naturereserves_brandenburg)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_naturereserves_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;
    
-- insert largescaleprotectedareas
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_largescaleprotectedareas_brandenburg
        WHERE typ = 'Nationalpark')
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_largescaleprotectedareas_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    
    
-- insert naturalmonuments_lkprignitz
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 50)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lkpr_naturalmonuments_lkprignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lkpr_natural monuments_lkprignitz',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;

-- insert naturalmonuments_lkopr
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 50)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lkopr_naturalmonuments_lkopr)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lkopr_natural monuments_lkopr',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;
    
-- insert protectedavenues_lkprignitz
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(ST_Force2D(geom),3035), 50)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lkpr_protectedavenues_lkprignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lkpr_protectedavenues_lkprignitz',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;
    
-- insert biotopes
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_biotopes_brandenburg
        WHERE bbgnat_t = 'geschÃ¼tztes Biotop')
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_biotopes_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    

-- insert ffhareas
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_ffhareas_brandenburg)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_ffhareas_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;

-- insert birdsanctuaries
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_birdsanctuaries_brandenburg)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_birdsanctuaries_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;
    
-- insert waterreserves
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_waterreserves_brandenburg)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_waterreserves_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    
    
-- insert floodwaterretentionareas
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.lfu_floodwaterretentionareas_brandenburg)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'lfu_floodwaterretentionareas_brandenburg',
        'restrictive',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    
    
-- insert already used areas (water bodies type 01)
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.dlm250_gew01_f_prignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'dlm250_gew01_f_prignitz',
        'restrictive',
        ST_AREA(area.geom),
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

--insert already used areas (settlement areas type 02)
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.dlm250_sie02_f_prignitz
        WHERE     "OBJART_TXT"= 'AX_TagebauGrubeSteinbruch' OR "OBJART_TXT"= 'AX_Siedlungsflaeche')
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'dlm250_sie02_f_prignitz',
        'restrictive',
        ST_AREA(area.geom),
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

--insert already used areas (vegetation areas type 02)
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.dlm250_veg02_f_prignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'dlm250_veg02_f_prignitz',
        'restrictive',
        ST_AREA(area.geom),
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

--insert already used areas (vegetation areas type 03)    
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.dlm250_veg03_f_prignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'dlm250_veg03_f_prignitz',
        'restrictive',
        ST_AREA(area.geom),
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

--insert already used areas (vegetation areas type 04)        
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.dlm250_veg04_f_prignitz)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'dlm250_veg04_f_prignitz',
        'restrictive',
        ST_AREA(area.geom),
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

-- combine all restrictive areas
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(geom))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    environment.windnode_ptg_prignitz
        WHERE    typ = 'restrictive' AND area>0)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,geom)
    SELECT    'all',
        'restrictive-all',
        area.geom ::geometry(MultiPolygon,3035)
    FROM    area;    

--create mview for all restrictive areas
DROP MATERIALIZED VIEW IF EXISTS    environment.windnode_ptg_prignitz_res_mview;
CREATE MATERIALIZED VIEW         environment.windnode_ptg_prignitz_res_mview AS
    SELECT     *
    FROM    environment.windnode_ptg_prignitz
    WHERE    typ = 'restrictive';
    
    
-- calculate study region area and restrictive area in study region

--calculate area
SELECT     'prignitz' AS region,
    'restrictive-all' AS area,
    ST_AREA(ST_UNION(geom)) AS area_in_
FROM    environment.windnode_ptg_prignitz
WHERE    typ = 'restrictive-all'
UNION ALL
SELECT     'prignitz' AS region,
    'all' AS area,
    ST_AREA(ST_UNION(geom)) AS area_in_
FROM    boundaries.vg250_4_krs_prignitz_mview;    


--create selective areas

--insert pv powerplants
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1000)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    supply.ego_dp_ee_powerplant_prignitz
        WHERE generation_subtype = 'solar_ground_mounted')
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'ego_dp_ee_powerplant_prignitz',
        'selective_pv',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    
    
--insert wind powerplants
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 1000)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    supply.ego_dp_ee_powerplant_prignitz
        WHERE generation_type = 'wind')
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'ego_dp_ee_powerplant_prignitz',
        'selective_wind',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    

--insert gasgrid
WITH     area AS (
        SELECT    ST_MULTI((ST_DUMP(ST_UNION(ST_BUFFER(ST_TRANSFORM(geom,3035), 5000)))).geom) ::geometry(MultiPolygon,3035) AS geom
        FROM    grid.windnode_gas)
INSERT INTO    environment.windnode_ptg_prignitz (source,typ,area,geom)
    SELECT    'windnode_gas',
        'selective_gas',
        ST_AREA(area.geom),
        ST_CollectionExtract(ST_MULTI(ST_INTERSECTION(area.geom,vg.geom)),3) ::geometry(MultiPolygon,3035)
    FROM    area, boundaries.vg250_4_krs_prignitz_mview AS vg
    WHERE    area.geom && vg.geom;    
    
--create mview for pv powerplants (for vizualization with GIS)
DROP MATERIALIZED VIEW IF EXISTS    environment.windnode_ptg_prignitz_solar_mview;
CREATE MATERIALIZED VIEW         environment.windnode_ptg_prignitz_solar_mview AS
    SELECT     *
    FROM    environment.windnode_ptg_prignitz
    WHERE    typ = 'selective_pv';
    
--create mview for wind powerplants (for vizualization with GIS)
DROP MATERIALIZED VIEW IF EXISTS    environment.windnode_ptg_prignitz_wind_mview;
CREATE MATERIALIZED VIEW         environment.windnode_ptg_prignitz_wind_mview AS
    SELECT     *
    FROM    environment.windnode_ptg_prignitz
    WHERE    typ = 'selective_wind';
    
--create mview for gasgrid (for vizualization with GIS)
DROP MATERIALIZED VIEW IF EXISTS    environment.windnode_ptg_prignitz_gasgrid_mview;
CREATE MATERIALIZED VIEW         environment.windnode_ptg_prignitz_gasgrid_mview AS
    SELECT     *
    FROM    environment.windnode_ptg_prignitz
    WHERE    typ = 'selective_gas';
    
    
-- optional: calculate PV and wind capacity

SELECT count(id), sum(electrical_capacity), generation_type
  FROM supply.ego_dp_ee_powerplant_prignitz
  GROUP BY generation_type;
  
    
-- identify suitable CO2-sources

-- create table for insertion of CO2-sources
DROP TABLE IF EXISTS     environment.windnode_ptg_co2_prignitz CASCADE;
CREATE TABLE         environment.windnode_ptg_co2_prignitz (
    ID SERIAL,
    electrical_capacity integer,
    kWh_2013 integer,
    kWh_average integer,
    ew_wert integer,
    generation_type text,
    generation_subtype text,
    city text,
    postcode text,
    address text,
    source text,
    comment text,
    in_area_res boolean, 
    in_area_sel_gasgrid boolean,
    in_area_sel_ee boolean,
    v_co2 integer,
    p_ptg_2500 integer,
    p_ptg_4000 integer,
    p_ptg_5500 integer,
    geom    geometry(Point,3035),
    CONSTRAINT windnode_ptg_co2_prignitz_pkey PRIMARY KEY (id));

-- grant (rli_write)
ALTER TABLE environment.windnode_ptg_co2_prignitz OWNER TO rli_write;

-- index GIST (geom)
CREATE INDEX windnode_ptg_co2_prignitz_geom_idx 
    ON environment.windnode_ptg_co2_prignitz USING gist (geom);

--insert biomass powerplants from oedb
INSERT INTO environment.windnode_ptg_co2_prignitz(electrical_capacity, kwh_2013, kwh_average, ew_wert, generation_type, generation_subtype,city,postcode,address,source,comment,geom)
    SELECT     vg.electrical_capacity,
    vg.kwh_2013,
    vg.kwh_average,
    vg.ew_wert,
    vg.generation_type,
    vg.generation_subtype,
    vg.city,
    vg.postcode,
    vg.address,
    vg.source,
    vg.comment,
    vg.geom ::geometry(Point,3035)
    FROM    supply.ego_dp_biomass_powerplant_prignitz vg
    WHERE (generation_subtype = 'biogas' OR generation_subtype = 'gas_sewage');
    
--insert biomass powerplants from lfu
INSERT INTO environment.windnode_ptg_co2_prignitz(electrical_capacity, kwh_average, generation_type, generation_subtype,city,postcode,address,source,comment,geom)
    SELECT vg.EL_kw,
    vg.kwh_average,
    'biomass',
    vg."Anl_Bez",
    vg."Ort",
    'kA',
    'kA',
    'lfu', 
    'kA',
    vg.geom ::geometry(Point,3035)
    FROM    supply.lfu_chpplant_prignitz vg
    WHERE"Abgleich_e" = 'Fehlt';

--insert biomass powerplants from bnetza
INSERT INTO environment.windnode_ptg_co2_prignitz(electrical_capacity, kwh_2013, kwh_average, generation_type, generation_subtype,city,postcode,address,source,comment,geom)
    SELECT vg."Leistung_e",
    vg.kwh_2013,
    vg.kwh_average,
    vg."Energietra",
    vg."Energietra_1",
    vg."Stadt",
    vg."PLZ",
    vg."Adresse",
    'BNetzA', 
    vg."Kommentar",
    vg.geom ::geometry(Point,3035)
    FROM    supply.bnetza_biomass_powerplant_prignitz vg
    WHERE "Energietra_1" = 'biogas';
    
/*
*not relevant because just biomass (Kronoply) and extraction from flue not economically viable    
--insert conventional powerplants from oedb
INSERT INTO environment.windnode_ptg_co2_prignitz(electrical_capacity, generation_type, generation_subtype,city,postcode,address,source,comment,geom)
    SELECT     vg.capacity,
    vg.fuel,
    'kA',
    vg.city,
    vg.postcode,
    vg.street,
    'kA',
    'kA',
    vg.geom ::geometry(Point,3035)
    FROM    supply.ego_dp_conv_powerplant_prignitz vg;
*/
    
--insert industry from UBA database
INSERT INTO environment.windnode_ptg_co2_prignitz(electrical_capacity, generation_type, generation_subtype,city,postcode,address,source,comment,v_co2,geom)
    SELECT     NULL,
    vg."Haupttäti",
    'kA',
    vg."Stadt",
    'kA',
    'ka',
    'UBA',
    'kA',
    vg.co2_2015,
    vg.geom ::geometry(Point,3035)
    FROM    economy.uba_industry_prignitz vg;

-- check if CO2 sources are suitable: in restrictive area?
UPDATE     environment.windnode_ptg_co2_prignitz AS t1
    SET      in_area_res = t2.in_area
    FROM    (SELECT    b.id AS id,
            TRUE AS in_area
        FROM    environment.windnode_ptg_prignitz AS a,
            environment.windnode_ptg_co2_prignitz AS b
        WHERE      a.geom && b.geom AND
            ST_CONTAINS(a.geom,b.geom) AND
            a.typ = 'restrictive'
        )AS t2
    WHERE t1.id = t2.id;

-- check if CO2 sources are suitable: within 5km radius of gasgrid?
UPDATE     environment.windnode_ptg_co2_prignitz AS t1
    SET      in_area_sel_gasgrid = t2.in_area
    FROM    (SELECT    b.id AS id,
            TRUE AS in_area
        FROM    environment.windnode_ptg_prignitz AS a,
            environment.windnode_ptg_co2_prignitz AS b
        WHERE      a.geom && b.geom AND
            ST_CONTAINS(a.geom,b.geom) AND
            a.typ = 'selective_gas'
        )AS t2
    WHERE t1.id = t2.id;
        
-- check if CO2 sources are suitable: within 5km radius of wind or pv ground-mounted plant?    
UPDATE     environment.windnode_ptg_co2_prignitz AS t1
    SET      in_area_sel_ee = t2.in_area
    FROM    (SELECT    b.id AS id,
            TRUE AS in_area
        FROM    environment.windnode_ptg_prignitz AS a,
            environment.windnode_ptg_co2_prignitz AS b
        WHERE      a.geom && b.geom AND
            ST_CONTAINS(a.geom,b.geom) AND
            (a.typ = 'selective_pv' OR a.typ = 'selective_wind')
        )AS t2
    WHERE t1.id = t2.id;

    
--calculate CO2-potential

--calculate average electricity production for biogas plants via average full load hours
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET kwh_average = (7900*electrical_capacity)
WHERE generation_subtype = 'biogas' ;

--calculate average electricity production for landfill gas plants via average full load hours
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET kwh_average = (6600*electrical_capacity)
WHERE generation_subtype='gas_landfill';

--calculate co2 potential for biogas and landfill gas plants
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET v_co2 = ((kwh_average/(0.36*9.968))*(0.47/0.52))
WHERE generation_subtype = 'biogas' or generation_subtype='gas_landfill';

--calculate co2 potential for sewage gas plants
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET v_co2 = (((ew_wert*48)/9.968)*(0.47/0.52))
WHERE generation_subtype = 'gas_sewage';

--calculate electrical capacity for ptg for 2500 full load hours
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET p_ptg_2500 = ((v_co2*9.968)/(0.6*2500));

--calculate electrical capacity for ptg for 4000 full load hours
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET p_ptg_4000 = ((v_co2*9.968)/(0.6*4000));

--calculate electrical capacity for ptg for 5500 full load hours
UPDATE environment.windnode_ptg_co2_prignitz AS t1
SET p_ptg_5500 = ((v_co2*9.968)/(0.6*5500));
    
    
-- optional: calculate shortest distance CO2-source to gas grid

-- NextNeighbour CO2 to gas grid
DROP MATERIALIZED VIEW IF EXISTS    supply.windnode_ptg_co2_gas_prignitz_mview;
CREATE MATERIALIZED VIEW            supply.windnode_ptg_co2_gas_prignitz_mview AS
    SELECT DISTINCT ON (a.id)
        a.id AS co2_id,
        b.id AS gas_id,
        a.geom,
        ST_ShortestLine(
            a.geom ::geometry(Point,3035),
            b.geom ::geometry(MultiLineString,3035)
            ) ::geometry(LineString,3035) AS geom_line,
        ST_Distance(a.geom,b.geom) AS distance_in_m
    FROM    environment.windnode_ptg_co2_prignitz AS a,     -- base
            grid.windnode_gas AS b                          -- target
    WHERE   ST_DWithin(a.geom,b.geom, 5000)   -- In a 5 km radius
    ORDER BY a.id, ST_Distance(a.geom,b.geom);
