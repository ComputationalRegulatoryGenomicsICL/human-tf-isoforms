#!/usr/bin/env nextflow

//nextflow.enable.dsl = 2

include { NF_ANALYSIS_REPRODUCTION } from './workflows/analysis_reproduction.nf'

workflow {
    NF_ANALYSIS_REPRODUCTION()
}
