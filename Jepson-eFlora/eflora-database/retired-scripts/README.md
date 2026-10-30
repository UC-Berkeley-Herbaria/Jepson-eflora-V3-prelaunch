## Historical Pipeline & Overview

# eFlora Database Refresh & KeyBase Pipeline
This process was for the SQlite3 version of the eflora which operated between 2016 and summer 2026.
This document outlines the steps required to recreate the taxonomy mapping files, update spatial and synonymy data, refresh the SQLite eFlora database, and generate KeyBase export files.

The original versions of the perl scripts are the originals in the main directory.  The most recent versions are the ones that replaced the SQLite3 version.

---

## A. Recreating the Taxonomy File (`IJM_sequence.txt`)

Before re-processing the eFlora database, the `IJM_sequence.txt` file must be recreated. 
* **Why it's needed:** If the update involves nomenclature changes only (with no key changes), `IJM_sequence` still needs to be refreshed. 
* **Handling new taxa/keys:** Because running the key creation steps generates an incorrect `IJM_sequence` if new taxa or keys are introduced (resulting in anomalous errors), `format_for_i.pl` must be run explicitly at this stage.

```bash
echo "Creating the IJM_sequence taxonomy file"
perl /Users/Shared/Jepson-Master/Jepson-eFlora/eflora_keys/format_for_i.pl
```

## B. Synonymy and Maps update

# Step 1: Update Synonymy Lists
## Update the synonymy files for ICPN and eFlora:

```bash
sh ../../Interchange/make_ICPN_taxon_lists.sh```


# Step 2: Get HCODES for Yellow Flagging
## Update HCODES used for yellow flagging in CCH1/eFlora maps and load the distribution table:

```bash
sh /Users/Shared/Jepson-Master/Jepson-eFlora/YELLOW_FLAGGING/get_HCODES.sh```


# Step 3: Refresh Yellow Flagging Files
## Update yellow flagging files required for eFlora maps and CCH1 yellow flag fields:

```bash
sh /Users/Shared/Jepson-Master/CCHV2/bulkload/refresh_yellow_flags.sh
```


# Step 4: Update GeoJSON Map Files
## Update GEOJSON eFlora map files with the new yellow flags:

```bash
perl /Users/Shared/Jepson-Master/Jepson-eFlora/YELLOW_FLAGGING/make_CCH1_geoJson.pl
```

### Note: Change the numeral in the file name on line 240 to force a refresh of all maps, and remember to clear your browser cache.


## C.  Refreshing eFlora Tables & Database
# This process drops and rebuilds the SQLite database tables, repopulates them from scripts, and creates index structures


# Drop and recreate tables
sqlite3 output/eflora.db < create_statements.sql

# Generate main data tables
perl make_main_table.pl
perl make_illustration_table.pl
perl make_taxonomy_table.pl
perl make_distribution_table.pl
perl make_synonymy_table.pl
perl make_keys_table.pl

# Insert records into SQLite tables
sqlite3 output/eflora.db < output/load_main_table.sql
sqlite3 output/eflora.db < output/load_illustration_table.sql
sqlite3 output/eflora.db < output/load_taxonomy_table.sql
sqlite3 output/eflora.db < output/load_distribution_table.sql
sqlite3 output/eflora.db < output/load_synonymy_table.sql
sqlite3 output/eflora.db < output/load_keys_table.sql

# Create database indexes
sqlite3 output/eflora.db < create_indexes.sql

# Clean up intermediate files
rm -v output/accepted_name_list.txt
rm -v output/dist_codes.txt

## D.  KeyBase Export Generation
# Finally, create bioregion distribution files and organize output directories for KeyBase:

# Generate KeyBase filters from the database
sqlite3 output/eflora.db < create_KeyBase_Filters.sql

# Move eFlora URL lists for KeyBase
mv keybase_urls.txt ../eflora_keys/keybase/output/urls

# Move bioregion region filter files to KeyBase output directory
mv D.txt DMoj.txt DMtns.txt DMojexcDMtns.txt DSon.txt \
   NW.txt NCo.txt KR.txt NCoR.txt NCoRO.txt NCoRH.txt NCoRI.txt \
   CaR.txt CaRF.txt CaRH.txt \
   SN.txt nSN.txt cSN.txt sSN.txt SNH.txt SNF.txt Teh.txt nSNH.txt nSNF.txt cSNH.txt cSNF.txt sSNH.txt sSNF.txt \
   GV.txt ScV.txt SnJV.txt \
   CW.txt CCo.txt SnFrB.txt SCoR.txt SCoRO.txt SCoRI.txt \
   SW.txt SCo.txt ChI.txt nChI.txt sChI.txt TR.txt WTR.txt SnGB.txt SnBr.txt PR.txt SnJt.txt PRexcSnJt.txt \
   GB.txt MP.txt Wrn.txt MPexcWrn.txt SNE.txt WaI.txt SNEexcWaI.txt \
   ../eflora_keys/keybase/output/filters/


