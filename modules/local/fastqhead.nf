process FASTQHEAD {
    tag "$meta.id"
    label 'process_low'

    container 'ubuntu:18.04'

    input:
    tuple val(meta), path(reads)
    val read_number

    output:
    tuple val(meta), path("*_head.fastq"), emit: head_fastq
    path "versions.yml"                  , emit: versions

    script:
    """
    gunzip -c -f ${reads} > temp.fastq

    head -\$((4*${read_number})) \\
        temp.fastq > \\
        ${meta.id}_head.fastq

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        fastqhead: 1.0
    END_VERSIONS
    """
}
