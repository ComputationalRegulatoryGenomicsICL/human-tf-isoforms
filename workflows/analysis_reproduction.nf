include { DOMAIN_ANALYSIS } from '../modules/local/domain_analysis.nf'

rmd_domain_analysis = file( "./rmd/domain_analysis.Rmd" )

humantfs_database = file( "./input/humantfs1.01/DatabaseExtract_v_1.01.csv" )

workflow NF_ANALYSIS_REPRODUCTION {

    DOMAIN_ANALYSIS( rmd_domain_analysis,
                     humantfs_database )

}
