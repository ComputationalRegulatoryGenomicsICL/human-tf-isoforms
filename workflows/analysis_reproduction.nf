include { DOMAIN_ANALYSIS } from '../modules/local/domain_analysis.nf'
include { VERSIONSHTML } from '../modules/local/versionshtml.nf'

rmd_domain_analysis = file( "./rmd/domain_analysis.Rmd" )

workflow NF_ANALYSIS_REPRODUCTION {

    DOMAIN_ANALYSIS( rmd_domain_analysis ) // add arguments for Rmd

    Channel
        .empty()
        .mix( DOMAIN_ANALYSIS.out.versions )
        .set{ ch_versions }

    VERSIONSHTML( ch_versions.unique().collectFile() )

}
