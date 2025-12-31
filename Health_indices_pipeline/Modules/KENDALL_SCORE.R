#kendaluniqueness
kendall_uniqueness <- function(data)
{
  dist_mat <- 1-cor.fk(t(data))
  diag(dist_mat) <- NA
  kendall_uniqueness <- apply(dist_mat,1,function(x)(min(x[!is.na(x)])))
  return(kendall_uniqueness)
}
