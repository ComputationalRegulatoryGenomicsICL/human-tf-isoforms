process SELECT_DOMAINS_AND_TF_ISOFORMS {
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
    path ensg_enst_ensp
    path tfs
    path ips_domains_ipr_ens99_final_strat
    path protein_fasta_tfs_99
    path ips_domains_ipr_ens99_int_specific_retained
    path domain_classification_wb
    path ensg_enst_tsl

    output:
    path "*.tsv" , emit: tables
    path "*.rds",  emit: rds
    path "*.html", emit: knitted_html

    script:
    """
    render_rmd.R \\
        ${rmd} \\
        ${ensg_enst_ensp} \\
        ${tfs} \\
        ${ips_domains_ipr_ens99_final_strat} \\
        ${protein_fasta_tfs_99} \\
        ${ips_domains_ipr_ens99_int_specific_retained} \\
        ${domain_classification_wb} \\
        ${ensg_enst_tsl}
    """
}
