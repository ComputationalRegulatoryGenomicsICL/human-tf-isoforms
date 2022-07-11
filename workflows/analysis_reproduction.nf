include { DOMAIN_ANALYSIS } from '../modules/local/domain_analysis.nf'

rmd_domain_analysis = file( "./rmd/domain_analysis.Rmd" )

humantfs_database = file( "./input/humantfs1.01/DatabaseExtract_v_1.01.csv" )

interpro_entries_list = file( "./input/interpro77.0/entry.list" )

workflow NF_ANALYSIS_REPRODUCTION {

    DOMAIN_ANALYSIS( rmd_domain_analysis,
                     humantfs_database,
                     interpro_entries_list )

}
