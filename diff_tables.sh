#!/usr/bin/env bash

NEWRESPATH="./results/output_per_module"
OLDRESPATH="/camp/home/sidoros/sidoros/projects/tf-splicing"

echo "${NEWRESPATH}/summarise_tfs_and_domains/tables/:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/dbd_ipr_humantfs.tsv ${OLDRESPATH}/analysis/dbd_ipr_humantfs.tsv | wc -l) \
    <(echo "dbd_ipr_humantfs.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/ensg_enst_ensp_99.tsv ${OLDRESPATH}/data/ensembl99/ensg_enst_ensp_99.tsv | wc -l) \
    <(echo "ensg_enst_ensp_99.tsv")
