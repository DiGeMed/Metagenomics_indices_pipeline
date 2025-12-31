Jaccard_Index <- function(abundance_matrix) {
  # Convert to binary presence-absence
  binary_matrix <- (abundance_matrix > 0) * 1
  
  # Compute Jaccard distance (pairwise between samples)
  jaccard_dist <- vegdist(binary_matrix, method = "jaccard", binary = TRUE)
  
  # Convert distance object to a square matrix
  dist_matrix <- as.matrix(jaccard_dist)
  
  # Calculate average distance of each sample to others
  sample_jaccard_scores <- (1-rowMeans(dist_matrix, na.rm = TRUE))
  
  return(sample_jaccard_scores)
}
