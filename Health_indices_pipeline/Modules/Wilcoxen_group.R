wilcox_batch_groups <- function(df, group_var, group_levels) {
  # Check if group levels are exactly 2
  if (length(group_levels) != 2) {
    stop("Exactly two group levels are required for comparison.")
  }
  
  # Filter only relevant rows based on group levels
  df_filtered <- df %>% filter(.data[[group_var]] %in% group_levels)
  
  # Separate features and group column
  group_labels <- df_filtered[[group_var]]
  
  # Remove non-numeric columns
  df_numeric <- df_filtered %>% 
    select(where(is.numeric)) %>% 
    t()  # Transpose for row-wise Wilcoxon tests
  
  # Ensure no all-zero rows (optional)
  df_numeric <- df_numeric[rowSums(df_numeric, na.rm = TRUE) != 0, ]
  
  # Perform Wilcoxon test row-wise
  results <- apply(df_numeric, 1, function(row_vals) {
    group1 <- row_vals[group_labels == group_levels[1]]
    group2 <- row_vals[group_labels == group_levels[2]]
    
    pval <- tryCatch({
      wilcox.test(group1, group2)$p.value
    }, error = function(e) NA)
    
    type <- ifelse(mean(group1, na.rm = TRUE) > mean(group2, na.rm = TRUE), 1,
                   ifelse(mean(group1, na.rm = TRUE) < mean(group2, na.rm = TRUE), -1, 0))
    
    c(p_value = pval,
      type = type,
      mean_group1 = mean(group1, na.rm = TRUE),
      mean_group2 = mean(group2, na.rm = TRUE))
  })
  
  # Format results
  results_df <- as.data.frame(t(results))
  results_df$FDR <- p.adjust(results_df$p_value, method = "fdr")
  results_df <- results_df[, c("p_value", "type", "FDR", "mean_group1", "mean_group2")]
  return(results_df)
}
