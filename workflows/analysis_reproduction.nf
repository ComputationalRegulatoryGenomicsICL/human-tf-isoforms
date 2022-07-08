include { DOMAIN_ANALYSIS } from '../modules/local/domain_analysis.nf'

rmd_domain_analysis = file( "./rmd/domain_analysis.Rmd" )

workflow NF_ANALYSIS_REPRODUCTION {

    DOMAIN_ANALYSIS( rmd_domain_analysis ) // add arguments for Rmd

}
