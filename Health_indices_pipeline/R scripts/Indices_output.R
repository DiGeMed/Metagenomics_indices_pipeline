setwd("Indices_calculation_modules")
source("Modules/Libraries.R")
load("../")
#example: for csv AB_M_csv<-read_abundance_matrix(file_path = "Metaphalan_csv_files/validation_abundance.csv")

#example: for txt AB_M_txt<-read_taxonomic_file(inp_dir = "Metaphlan_taxnomic_files/")


AB_M<-read_abundance_matrix(file_path = "Metaphalan_csv_files/validation_abundance.csv")

#indices calculation
df_score<-data.frame("Jaccard"=Jaccard_Index(AB_M),"Shannon"=diversity(AB_M),"HACK_Top_17_score"=hack_top_17(AB_M),"GMHI_score"=GMHI(AB_M),"Dysbiosis_score"=dysbiosis_score(AB_M),
                     "Kendall_uniqueness_score"=kendall_uniqueness(AB_M),"GMHI_HACK_score"=GMHI_hack_top_17(AB_M),
                     "Simpson"=diversity(AB_M,index = "simpson"),"Bray_Curtis"=BrayCurtis_Index(AB_M))

#merging metadata of group, metadata_cols can be changed according to your column name sample ids and type groups(both control and diseased)
df_score_Subject<-join_metadata(score_df = df_score,
                                metadata_path ="Metaphalan_csv_files/validation_metadata.csv",
                                metadata_cols = c("Sample_Ids", "Phenotype_all1"))

#change the group levels if your data different groups
plot_microbiome_scores(df_score_Subject,group_var = "Phenotype_all1",group_levels = c("CRC (N-8)","Healthy (N-8)"))

#Wilcoxen_significant_test
wilcox_p<-wilcox_batch_groups(df_score_Subject,group_var = "Phenotype_all1",group_levels = c("CRC (N-8)","Healthy (N-8)"))
