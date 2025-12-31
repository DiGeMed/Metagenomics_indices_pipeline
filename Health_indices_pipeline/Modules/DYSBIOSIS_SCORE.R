#dysbiosis_score
dysbiosis_score <- function(data,control_group)
{
  dist_mat <- as.matrix(vegdist(data,method="bray"))
  diag(dist_mat) <- NA
  dysbiosis_score <- apply(dist_mat[,control_group],1,function(x)(median(x[!is.na(x)])))
  return(dysbiosis_score)
}