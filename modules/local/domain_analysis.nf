process DOMAIN_ANALYSIS {
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
    path tf_coding_transcripts_final_ens99_with_fam_names_corrected_with_tsl
    path ens99_pep
    path canonical_dbd_iprs

    output:
    path "*.tsv" , emit: tables, optional: true
    path "*.pdf" , emit: panels, optional: true
    path "*.html", emit: knitted_html

    script:
    """
    render_rmd.R \\
        ${rmd} \\
        ${tf_coding_transcripts_final_ens99_with_fam_names_corrected_with_tsl} \\
        ${ens99_pep} \\
        ${canonical_dbd_iprs}
    """
}
