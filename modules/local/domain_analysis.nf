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
    path "versions.yml"            , emit: versions

    script:
    """
    render_rmd.R $rmd # arguments for Rmd

    # Add other package versions
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        Bash: \$(echo "\$BASH_VERSION")
        R: \$(R --version | head -1 | awk '{print \$3}')
        R_dplyr: \$(Rscript -e 'packageVersion("dplyr")' | awk '{print \$2}' | tr -d "‘’")
        R_ggplot2: \$(Rscript -e 'packageVersion("ggplot2")' | awk '{print \$2}' | tr -d "‘’")
    END_VERSIONS
    """
}
