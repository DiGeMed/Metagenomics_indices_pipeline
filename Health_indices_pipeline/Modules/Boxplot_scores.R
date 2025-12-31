plot_microbiome_scores <- function(data, group_var = "Phenotype", group_levels = NULL) {
  
  # Scores you want to plot
  score_vars <- c("Jaccard","Simpson","GMHI", "GMHI_HACK_score", "Kendall_uniqueness_score", "Dysbiosis_score", "Shannon",  "HACK_Top_17_score")
  
  # Keep only those columns if they exist
  existing_scores <- score_vars[score_vars %in% colnames(data)]
  
  # Warn if none found
  if (length(existing_scores) == 0) {
    stop("None of the specified score columns exist in the data.")
  }
  
  # Drop NA group_var & optionally filter based on group_levels
  data <- data %>%
    filter(!is.na(.data[[group_var]])) %>%
    { if (!is.null(group_levels)) filter(., .data[[group_var]] %in% group_levels) else . } %>%
    mutate(!!group_var := factor(.data[[group_var]], levels = group_levels))
  
  # Convert to long format
  data_long <- data %>%
    pivot_longer(cols = all_of(existing_scores), names_to = "Score", values_to = "Value")
  
  # Plot
  ggplot(data_long, aes(x = .data[[group_var]], y = Value, fill = .data[[group_var]])) +
    geom_boxplot(outlier.shape = NA, alpha = 0.7) +
    geom_jitter(width = 0.2, alpha = 0.4, color = "black", size = 0.5) +
    facet_wrap(~Score, scales = "free_y", ncol = 3) +
    theme_bw() +
    labs(x = group_var, y = "Score", title = "Microbiome Health Scores by Group") +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none"
    )
}
