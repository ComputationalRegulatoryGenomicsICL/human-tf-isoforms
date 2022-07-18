include { DOMAIN_ANALYSIS } from '../modules/local/domain_analysis.nf'

rmd_domain_analysis = file( "./rmd/domain_analysis_min.Rmd" )

humantfs_database = file( "./input/humantfs1.01/DatabaseExtract_v_1.01.csv" )

interpro_entries_list = file( "./input/interpro77.0/entry.list" )

ensembl99_all_table = file( "./input/ensembl99/ensg_enst_ensp_99.tsv" )

gene_biotype_table = file( "./input/ensembl99/gene_biotype_table_99_selected.tsv" )

protein_fasta_tfs = file( "./input/interpro_scans/protein_fasta_tfs_99.fa.tsv" )

ipr_hierarchy_yaml = file ( "./input/interpro77.0/ParentChildTreeFile_with_status.yaml" )

draft_classification_table = file( "./input/domain_classification/interpro_domain_binary_classification.tsv" )

domain_classification_wb = file( "./input/domain_classification/domain_table_manually_annotated.xlsx" )

ensg_enst_tsl = file( "./input/ensembl99/ensg_enst_tsl_99.tsv" )

ens99_pep = file( "./input/ensembl99/Homo_sapiens.GRCh38.pep.all.99.tsv.gz" )

nondbd_annot = file( "./input/domain_classification/Other_domains_manually_curated_filled.csv" )

workflow NF_ANALYSIS_REPRODUCTION {

    DOMAIN_ANALYSIS( rmd_domain_analysis,
                     humantfs_database,
                     interpro_entries_list,
                     ensembl99_all_table,
                     gene_biotype_table,
                     protein_fasta_tfs,
                     ipr_hierarchy_yaml,
                     draft_classification_table,
                     domain_classification_wb,
                     ensg_enst_tsl,
                     ens99_pep,
                     nondbd_annot )

}
