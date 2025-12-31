join_metadata <- function(score_df, metadata_path, metadata_cols = c("Sample_Ids", "Phenotype_all1")) {
  # Read metadata
  metadata <- read.csv(metadata_path)
  
  # Add Sample_Ids from rownames
  score_df$Sample_Ids <- rownames(score_df)
  
  # Perform left join
  merged_df <- score_df %>%
    dplyr::left_join(metadata[, metadata_cols], by = "Sample_Ids")
  
  return(merged_df)
}

