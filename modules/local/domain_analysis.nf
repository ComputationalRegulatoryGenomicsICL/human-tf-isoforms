process DOMAIN_ANALYSIS {
    label 'process_medium'
    stageInMode 'copy'

    container 'sviatsidorov/r_machine:1.0'

    input:
    //tuple val(meta), path(bowtie2_log)
    path rmd

    output:
    tuple val(meta), path("tsv")   , emit: tsv_dir
    tuple val(meta), path("pdf")   , emit: pdf_dir
    tuple val(meta), path("*.html"), emit: knitted_html

    script:
    """
    render_rmd.R $rmd # arguments for Rmd
    """
}
