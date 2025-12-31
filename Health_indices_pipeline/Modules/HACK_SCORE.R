#hack_top17
hack_top_17 <- function(data) { 
  hack_top_17 <-  hack_top_17 <- c("Faecalibacterium_prausnitzii","Bacteroides_uniformis","Odoribacter_splanchnicus","Fusicatenibacter_saccharivorans","Coprococcus_catus","Eubacterium_rectale","Oscillibacter_sp_57_20","Eubacterium_ramulus","Agathobaculum_butyriciproducens","Roseburia_inulinivorans","Roseburia_intestinalis","Ruminococcus_bromii","Roseburia_hominis","Alistipes_shahii","Eubacterium_eligens","Roseburia_faecis","Alistipes_putredinis")
  
  
  # Subset to matching species
  matched <- intersect(colnames(data), hack_top_17)
  
  # Skip if none match
  if (length(matched) == 0) return(rep(NA, nrow(data)))
  
  # Rank-scale each column
  scaled <- apply(data[, matched, drop=FALSE], 2, rank_scale)
  
  # Ensure 2D (in case only 1 column)
  if (is.null(dim(scaled))) {
    scaled <- matrix(scaled, ncol=1)
  }
  
  return(rowSums(scaled))
}