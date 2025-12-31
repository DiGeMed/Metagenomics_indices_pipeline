library(vegan)

BrayCurtis_Index <- function(abundance_matrix) {
  # Compute Bray–Curtis distance between samples
  bray_dist <- vegdist(abundance_matrix, method = "bray")
  
  # Convert distance object to a square matrix
  dist_matrix <- as.matrix(bray_dist)
  
  # Calculate average similarity for each sample
  # Similarity = 1 - distance
  sample_bray_scores <- 1 - rowMeans(dist_matrix, na.rm = TRUE)
  
  return(sample_bray_scores)
}
