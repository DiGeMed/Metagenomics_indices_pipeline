#GMHI
#shannon
library(vegan)
diversity <- vegan::diversity
GMHI <- function(data) {
  
  library(dplyr)
  
  tmp1 <- data.frame(t(data),check.rows = F,check.names = F) 
  
  MH_species <- c("Alistipes_senegalensis","Bacteroidales_bacterium_ph8","Bifidobacterium_adolescentis","Bifidobacterium_angulatum","Bifidobacterium_catenulatum","Lachnospiraceae_bacterium_8_1_57FAA","Sutterella_wadsworthensis")
  
  MN_species <- c("Anaerotruncus_colihominis","Atopobium_parvulum","Bifidobacterium_dentium","Blautia_producta","candidate_division_TM7_single_cell_isolate_TM7c","Clostridiales_bacterium_1_7_47FAA","Clostridium_asparagiforme","Clostridium_bolteae","Clostridium_citroniae","Clostridium_clostridioforme","Clostridium_hathewayi","Clostridium_nexile","Clostridium_ramosum","Clostridium_symbiosum","Eggerthella_lenta","Erysipelotrichaceae_bacterium_2_2_44A","Flavonifractor_plautii","Fusobacterium_nucleatum","Gemella_morbillorum","Gemella_sanguinis","Granulicatella_adiacens","Holdemania_filiformis","Klebsiella_pneumoniae","Lachnospiraceae_bacterium_1_4_56FAA","Lachnospiraceae_bacterium_2_1_58FAA","Lachnospiraceae_bacterium_3_1_57FAA_CT1","Lachnospiraceae_bacterium_5_1_57FAA","Lachnospiraceae_bacterium_9_1_43BFAA","Lactobacillus_salivarius","Peptostreptococcus_stomatis","Ruminococcaceae_bacterium_D16","Ruminococcus_gnavus","Solobacterium_moorei","Streptococcus_anginosus","Streptococcus_australis","Streptococcus_gordonii","Streptococcus_infantis","Streptococcus_mitis","Streptococcus_sanguinis","Streptococcus_vestibularis","Subdoligranulum_sp_4_3_54A2FAA","Subdoligranulum_variabile","Veillonella_atypica")
  
  
  MH_species_metagenome <- tmp1[row.names(tmp1) %in% MH_species, ]
  MN_species_metagenome <- tmp1[row.names(tmp1) %in% MN_species, ]
  
  
  alpha <- function(x){sum((log(x[x>0]))*(x[x>0]))*(-1)}
  MH_shannon <- apply((MH_species_metagenome), 2, alpha) 
  MN_shannon <- apply((MN_species_metagenome), 2, alpha) 
  
  R_MH <- apply(MH_species_metagenome, 2, function(i) (sum(i > 0))) 
  R_MN <- apply(MN_species_metagenome, 2, function(i) (sum(i > 0)))
  
  
  #By default from methods
  MH_prime <- 7
  MN_prime <- 31
  
  psi_MH <- ((R_MH/MH_prime)*MH_shannon) 
  psi_MN <- ((R_MN/MN_prime)*MN_shannon)
  
  GMHI <- suppressWarnings(data.frame(log10((psi_MH+0.00001)/(psi_MN+0.00001))))
  colnames(GMHI) <- c("GMHI")
  GMHI$GMHI[is.nan(GMHI$GMHI)] <- 0
  return(GMHI)
}