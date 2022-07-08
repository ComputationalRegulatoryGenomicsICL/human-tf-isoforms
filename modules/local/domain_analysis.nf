process DOMAIN_ANALYSIS {
    label 'process_medium'
    stageInMode 'copy'

    container 'sviatsidorov/r_machine:1.0'

    input:
    path rmd
    // arguments for rmd
    // tuple path(...), path(...), ...

    output:
    path "tsv"   , emit: tsv_dir
    path "pdf"   , emit: pdf_dir
    path "*.html", emit: knitted_html

    script:
    """
    render_rmd.R $rmd # arguments for Rmd
    """
}
