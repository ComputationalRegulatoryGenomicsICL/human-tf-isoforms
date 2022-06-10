include { FASTQC } from '../modules/nf-core/modules/fastqc/main.nf'
include { READ_NAMES } from '../modules/local/read_names.nf'
//include { FLOWCELL } from '../modules/local/flowcell.nf'
include { FASTQHEAD } from '../modules/local/fastqhead.nf'
include { BOWTIE2_ALIGN } from '../modules/nf-core/modules/bowtie2/align/main'

reads = [
    [
        [
            id: "testx",
            single_end: true
        ],
        "https://github.com/hartwigmedical/testdata/raw/master/100k_reads_hiseq/TESTX/TESTX_H7YRLADXX_S1_L001_R1_001.fastq.gz"
    ],
    [
        [
            id: "testy",
            single_end: true
        ],
        "https://github.com/hartwigmedical/testdata/raw/master/100k_reads_hiseq/TESTY/TESTY_H7YRLADXX_S1_L001_R1_001.fastq.gz"
    ]
]

Channel
    .from( reads )
    .map{ row -> [ row[0], file(row[1], checkIfExists: true) ] }
    .set{ ch_reads }

Channel
    //.from( file( params.genomes['GRCh38'].bowtie2 ) )
    .from( file( "/Users/sidoros/nextflow-example/Bowtie2Index" ) )
    .set{ ch_index }

workflow NF_EXAMPLE {

    //ch_index.view()

    FASTQC( ch_reads )

    READ_NAMES( ch_reads )

    FASTQHEAD( ch_reads, 1000 )

    //FLOWCELL( READ_NAMES.out.read_names )

    //BOWTIE2_ALIGN( ch_reads, ch_index, false, true )
    BOWTIE2_ALIGN( FASTQHEAD.out.head_fastq.filter( ~/.*testx.*/ ), 
                   ch_index, false, true )

}
