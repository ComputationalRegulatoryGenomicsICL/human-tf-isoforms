#!/usr/bin/env bash

echo -e "results/output_per_module/summarise_tfs_and_domains/tables/:\n"
echo -n "> dbd_ipr_humantfs.tsv: "
diff results/output_per_module/summarise_tfs_and_domains/tables/dbd_ipr_humantfs.tsv /camp/home/sidoros/sidoros/projects/tf-splicing/analysis/dbd_ipr_humantfs.tsv
