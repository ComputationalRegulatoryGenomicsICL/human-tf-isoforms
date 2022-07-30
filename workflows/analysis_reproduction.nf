include { SUMMARISE_TFS_AND_DOMAINS } from '../modules/local/summarise_tfs_and_domains.nf'
include { PREPROCESS_DOMAIN_MATCHES } from '../modules/local/preprocess_domain_matches.nf'
include { SELECT_DOMAINS_AND_TF_ISOFORMS } from '../modules/local/select_domains_and_tf_isoforms.nf'
include { DBD_ANALYSIS } from '../modules/local/dbd_analysis.nf'
include { ANNOTATE_NONDBDS } from '../modules/local/annotate_nondbds.nf'

// R Markdown files
rmd_summarise_tfs_and_domains = file( "./rmd/summarise_tfs_and_domains.Rmd" )
rmd_preprocess_domain_matches = file( "./rmd/preprocess_domain_matches.Rmd" )
rmd_select_domains_and_tf_isoforms = file( "./rmd/select_domains_and_tf_isoforms.Rmd" )
rmd_dbd_analysis = file( "./rmd/dbd_analysis.Rmd" )
rmd_annotate_nondbds = file( "./rmd/annotate_nondbds.Rmd" )

// Input data
humantfs = file( "./input/humantfs1.01/DatabaseExtract_v_1.01.csv.gz" )
interpro_entries = file( "./input/interpro77.0/entry.list.gz" )
ensg_enst_ensp = file( "./input/ensembl99/ensg_enst_ensp_99.tsv.gz" )
gene_biotype_table = file( "./input/ensembl99/gene_biotype_table_99_selected.tsv" )
protein_fasta_tfs = file( "./input/interpro_scans/protein_fasta_tfs_99.fa.tsv.gz" )
ipr_hierarchy_yaml = file ( "./input/interpro77.0/ParentChildTreeFile_with_status.yaml" )
draft_classification_table = file( "./input/domain_classification/interpro_domain_binary_classification.tsv" )
domain_classification_wb = file( "./input/domain_classification/domain_table_manually_annotated.xlsx" )
ensg_enst_tsl = file( "./input/ensembl99/ensg_enst_tsl_99.tsv.gz" )
ens99_pep = file( "./input/ensembl99/Homo_sapiens.GRCh38.pep.all.99.tsv.gz" )
nondbd_annot = file( "./input/domain_classification/Other_domains_manually_curated_filled.tsv" )
protein_fasta_tfs_99 = file( "./input/interpro_scans/protein_fasta_tfs_99.fa.gz" )


workflow NF_ANALYSIS_REPRODUCTION {

    SUMMARISE_TFS_AND_DOMAINS ( 
        rmd_summarise_tfs_and_domains,
        humantfs,
        interpro_entries,
        ensg_enst_ensp,
        gene_biotype_table,
        protein_fasta_tfs
    )

    PREPROCESS_DOMAIN_MATCHES (
        rmd_preprocess_domain_matches,
        interpro_entries,
        SUMMARISE_TFS_AND_DOMAINS.out.ips_domains_ipr_ens99,
        ipr_hierarchy_yaml,
        SUMMARISE_TFS_AND_DOMAINS.out.humantfs_dbd_ids,
        SUMMARISE_TFS_AND_DOMAINS.out.ips_domains_ipr_ens99_iprs,
        SUMMARISE_TFS_AND_DOMAINS.out.dbd_ipr_humantfs,
        ensg_enst_ensp,
        SUMMARISE_TFS_AND_DOMAINS.out.tfs,
        draft_classification_table,
        domain_classification_wb
    )

    SELECT_DOMAINS_AND_TF_ISOFORMS (
        rmd_select_domains_and_tf_isoforms,
        ensg_enst_ensp,
        SUMMARISE_TFS_AND_DOMAINS.out.tfs,
        PREPROCESS_DOMAIN_MATCHES.out.ips_domains_ipr_ens99_final_strat,
        protein_fasta_tfs_99,
        PREPROCESS_DOMAIN_MATCHES.out.ips_domains_ipr_ens99_int_specific_retained,
        domain_classification_wb,
        ensg_enst_tsl,
        humantfs
    )

    DBD_ANALYSIS ( 
        rmd_dbd_analysis,
        SELECT_DOMAINS_AND_TF_ISOFORMS.out.tf_coding_transcripts_final_ens99_with_fam_names_corrected_with_tsl,
        ens99_pep,
        SELECT_DOMAINS_AND_TF_ISOFORMS.out.canonical_dbd_iprs
    )

    ANNOTATE_NONDBDS (
        rmd_annotate_nondbds,
        SELECT_DOMAINS_AND_TF_ISOFORMS.out.tf_coding_transcripts_final_ens99_with_fam_names_corrected_with_tsl,
        nondbd_annot
    )

}
