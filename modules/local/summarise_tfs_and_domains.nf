process SUMMARISE_TFS_AND_DOMAINS {
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
    path humantfs 
    path interpro_entries
    path ensembl99_all
    path gene_biotype_table
    path protein_fasta_tfs

    output:
    path "*.tsv" , emit: tables
    path "*.pdf" , emit: plots
    path "*.html", emit: knitted_html

    script:
    """
    render_rmd.R \\
        ${rmd} \\
        ${humantfs} \\
        ${interpro_entries} \\
        ${ensembl99_all} \\
        ${gene_biotype_table} \\
        ${protein_fasta_tfs}
    """
}
