process FLOWCELL {
    tag "$meta.id"
    label 'process_low'

    container 'ubuntu:18.04'

    input:
    tuple val(meta), path(read_names)

    output:
    tuple val(meta), path("*_flowcells.txt"), emit: flowcells
    path "versions.yml"                     , emit: versions

    script:
    """
    cut -d':' -f3 ${read_names} | \\
    sort | \\
    uniq > \\
    ${meta.id}_flowcells.txt

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        flowcell: 1.0
    END_VERSIONS
    """
}
