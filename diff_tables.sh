#!/usr/bin/env bash

NEWRESPATH="./results/output_per_module"
OLDRESPATH="/camp/home/sidoros/sidoros/projects/tf-splicing"

echo "${NEWRESPATH}/summarise_tfs_and_domains/tables:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/dbd_ipr_humantfs.tsv ${OLDRESPATH}/analysis/dbd_ipr_humantfs.tsv | wc -l) \
    <(echo "dbd_ipr_humantfs.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/ensg_enst_ensp_99.tsv ${OLDRESPATH}/data/ensembl99/ensg_enst_ensp_99.tsv | wc -l) \
    <(echo "ensg_enst_ensp_99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/humantfs_dbd_ids.tsv ${OLDRESPATH}/analysis/humantfs_dbd_ids.tsv | wc -l) \
    <(echo "humantfs_dbd_ids.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/ips_domains_ipr_ens99_iprs.tsv ${OLDRESPATH}/analysis/ips_domains_ipr_ens99_iprs.tsv | wc -l) \
    <(echo "ips_domains_ipr_ens99_iprs.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/ips_domains_ipr_ens99.tsv ${OLDRESPATH}/analysis/ips_domains_ipr_ens99.tsv | wc -l) \
    <(echo "ips_domains_ipr_ens99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/protein_fasta_tfs_99.fa.tsv ${OLDRESPATH}/analysis/scan_interpro/output/scan_results/all_analyses_ens99/protein_fasta_tfs_99.fa.tsv | wc -l) \
    <(echo "protein_fasta_tfs_99.fa.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/summarise_tfs_and_domains/tables/tfs.tsv ${OLDRESPATH}/analysis/tfs.tsv | wc -l) \
    <(echo "tfs.tsv")

echo "./results/output_per_module/preprocess_domain_matches/tables:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/preprocess_domain_matches/tables/domain_table.tsv ${OLDRESPATH}/analysis/filter_ipr_hierarchy/domain_table.tsv | wc -l) \
    <(echo "domain_table.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/preprocess_domain_matches/tables/ensg_enst_ensp_99.tsv ${OLDRESPATH}/data/ensembl99/ensg_enst_ensp_99.tsv | wc -l) \
    <(echo "ensg_enst_ensp_99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/preprocess_domain_matches/tables/ips_domains_ipr_ens99_int_specific_retained.tsv ${OLDRESPATH}/analysis/filter_ipr_hierarchy/ips_domains_ipr_ens99_int_specific_retained_ipr_status_ancestors_fam.tsv | wc -l) \
    <(echo "ips_domains_ipr_ens99_int_specific_retained.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/preprocess_domain_matches/tables/prelim_classification_table.tsv ${OLDRESPATH}/analysis/classify_domains/output/classify_domains/prelim_classification_table.tsv | wc -l) \
    <(echo "prelim_classification_table.tsv")

echo "./results/output_per_module/select_domains_and_tf_isoforms/tables:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/select_domains_and_tf_isoforms/tables/ensg_enst_ensp_99.tsv ${OLDRESPATH}/data/ensembl99/ensg_enst_ensp_99.tsv | wc -l) \
    <(echo "ensg_enst_ensp_99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/select_domains_and_tf_isoforms/tables/ensg_enst_tsl_99.tsv ${OLDRESPATH}/data/ensembl99/ensg_enst_tsl_99.tsv | wc -l) \
    <(echo "ensg_enst_tsl_99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/select_domains_and_tf_isoforms/tables/lost_tf_table_tsl1_tsl2_tslNA_mane.tsv ${OLDRESPATH}/data/results/lost_tf_table_tsl1_tsl2_tslNA_mane.tsv | wc -l) \
    <(echo "lost_tf_table_tsl1_tsl2_tslNA_mane.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/select_domains_and_tf_isoforms/tables/tf_coding_transcripts_final_ens99_with_fam_names_corrected.with_tsl.tsv ${OLDRESPATH}/data/results/domain_analysis/tf_coding_transcripts_final_ens99_with_fam_names_corrected.with_tsl.tsv | wc -l) \
    <(echo "tf_coding_transcripts_final_ens99_with_fam_names_corrected.with_tsl.tsv")

echo "./results/output_per_module/domain_analysis/tables:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/domain_analysis/tables/base_dbd_expression_analysis_table.tsv ${OLDRESPATH}/data/results/base_dbd_expression_analysis_table.tsv | wc -l) \
    <(echo "base_dbd_expression_analysis_table.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/domain_analysis/tables/Homo_sapiens.GRCh38.pep.all.99.tsv ${OLDRESPATH}/data/ensembl99/Homo_sapiens.GRCh38.pep.all.99.tsv | wc -l) \
    <(echo "Homo_sapiens.GRCh38.pep.all.99.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/domain_analysis/tables/isoforms_no_dbd_list.tsv ${OLDRESPATH}/data/results/isoforms_no_dbd_list.tsv | wc -l) \
    <(echo "isoforms_no_dbd_list.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/domain_analysis/tables/isoforms_no_domains_list.tsv ${OLDRESPATH}/data/results/isoforms_no_domains_list.tsv | wc -l) \
    <(echo "isoforms_no_domains_list.tsv")

echo "./results/output_per_module/annotate_nondbds/tables:"

paste -d$'\t' \
    <(diff ${NEWRESPATH}/annotate_nondbds/tables/Other_domains_manually_curated_raw.tsv ${OLDRESPATH}/analysis/classify_domains/output/classify_domains/Other_domains_manually_curated_raw.csv | wc -l) \
    <(echo "Other_domains_manually_curated_raw.tsv")

paste -d$'\t' \
    <(diff ${NEWRESPATH}/annotate_nondbds/tables/Other_domains_manually_curated_summary_mol_function_dbdminus.tsv ${OLDRESPATH}/analysis/classify_domains/output/classify_domains/Other_domains_manually_curated_summary_mol_function_dbdminus_filled.tsv | wc -l) \
    <(echo "Other_domains_manually_curated_summary_mol_function_dbdminus.tsv")
