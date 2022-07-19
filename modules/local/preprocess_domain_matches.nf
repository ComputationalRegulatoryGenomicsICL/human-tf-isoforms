process PREPROCESS_DOMAIN_MATCHES {
    //label 'process_medium'
    label 'process_low'
    stageInMode 'copy'

    // Output tables, panels and the notebook in the overall dirs
    publishDir "${params.outdir}/output_all/tables", pattern: "*.tsv", mode: params.publish_dir_mode
    publishDir "${params.outdir}/output_all/panels", pattern: "*.pdf", mode: params.publish_dir_mode
    publishDir "${params.outdir}/output_all/notebooks", pattern: "*.html", mode: params.publish_dir_mode

    // Output tables, panels and the notebook in the module-specific dirs
    publishDir "${params.outdir}/output_per_module/${task.process.tokenize(':')[-1].toLowerCase()}/tables", pattern: "*.tsv", mode: params.publish_dir_mode
    publishDir "${params.outdir}/output_per_module/${task.process.tokenize(':')[-1].toLowerCase()}/panels", pattern: "*.pdf", mode: params.publish_dir_mode
    publishDir "${params.outdir}/output_per_module/${task.process.tokenize(':')[-1].toLowerCase()}/notebooks", pattern: "*.html", mode: params.publish_dir_mode

    container 'sviatsidorov/r_machine:1.1'

    input:
    path rmd
    path interpro_entries
    path ips_domains_ipr_ens99
    path ipr_hierarchy_yaml
    path humantfs_dbd_ids
    path ips_domains_ipr_ens99_iprs
    path dbd_ipr_humantfs
    path ensg_enst_ensp
    path tfs

    // path humantfs 
    // path ensembl99_all
    // path gene_biotype_table
    // path protein_fasta_tfs
    // path draft_classification_table
    // path domain_classification_wb
    // path ensg_enst_tsl
    // path ens99_pep
    // path nondbd_annot

    output:
    //path "*.tsv" , emit: tables
    //path "*.pdf" , emit: panels
    path "*.html", emit: knitted_html

    script:
    """
    render_rmd.R \\
        ${rmd} \\
        ${interpro_entries} \\
        ${ips_domains_ipr_ens99} \\
        ${ipr_hierarchy_yaml} \\
        ${humantfs_dbd_ids} \\
        ${ips_domains_ipr_ens99_iprs} \\
        ${dbd_ipr_humantfs} \\
        ${ensg_enst_ensp} \\
        ${tfs}
    """
}
