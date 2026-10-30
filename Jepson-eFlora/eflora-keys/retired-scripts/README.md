## Historical Pipeline & Overview




# Legacy eFlora Key Generation Scripts

---

Previously, the following scripts were run at this stage in the workflow:
* `index_full.pl`
* `make_IJM_index.pl`
* `make_search_word_list.pl`

# Legacy Indexing Tool (`index_full.pl`)

> **⚠️ Warning:** I am no longer entirely sure what this does. It is preserved here strictly for archival or historical purposes.
> **⚠️ Warning:** This documentation and the associated scripts are largely **deprecated**. Most indices are now generated automatically via SQL scripts.


## Historical Context

This script pipeline likely played a role in:
1. The original **TJM2** (The Jepson Manual, Second Edition) updating process.
2. Updating the search functionality back when the eFlora relied on text hashes.

### Current Status
It is almost certainly **obsolete**, as the eFlora has since transitioned to a database-driven architecture. 

---

## Pipeline Overview

For historical reference, the pipeline executed the following flow:

```bash
perl index_full.pl all_revised_files.post.txt | perl assign_codes.pl | perl search_word_codes.pl > words_for_IJM_search.txt```

*(These have been replaced by database/SQL-driven index generation.)*

---

## Current Workflow & Glossary Updates

Key hashes are expanded using `expand_gloss_new.pl` whenever the glossary is updated. 

### Steps to Update the Glossary:

1. **Check if the glossary has changed:**
   > *"Have you changed the glossary file recently? If so, re-run `expand_gloss_new.pl`"*

2. **Integrate Output Files:**
   * The output files `GLOSS_TAGS.txt` and `GLOSS_HTML.txt` must be manually added to the appropriate section of `format_for_i.pl`.
   * Once added, the eFlora needs to be re-made to incorporate the new tags into the eFlora key hash.

---

## Key Generation Shell Script Reference

For historical or maintenance reference, the key-building process executes the following sequence:

```bash
# 1. Expand family keys
perl gloss_subs_expanded_family_keys.pl

# 2. Prepare species keys from the treatment
perl format_for_i.pl

# 3. Make expanded keys & key hash
perl gloss_subs_expanded_keys.pl
perl gloss_subs_expanded_keys.pl

# 4. Make key hashes from treatments
perl format_family_key.pl > all_family_key.html
perl make_family_group_keys.pl

```







