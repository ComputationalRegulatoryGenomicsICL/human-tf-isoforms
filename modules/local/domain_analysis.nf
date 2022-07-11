process DOMAIN_ANALYSIS {
    //label 'process_medium'
    label 'process_low'
    stageInMode 'copy'

    container 'sviatsidorov/r_machine:1.0'

    input:
    path rmd
    tuple path("humantfs_name"), path("interpro_entries_name")

    output:
    path "tables"       , emit: tables_dir
    path "figure_panels", emit: figure_panels_dir
    path "*.html"       , emit: knitted_html

    script:
    """
    render_rmd.R \\
        ${rmd} \\
        ${humantfs_name} \\
        ${interpro_entries_name}
    """
}
