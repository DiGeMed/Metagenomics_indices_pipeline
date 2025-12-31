GMHI_hack_top_17 <- function(data)
{
  MH_Species <- c("Alistipes_senegalensis","Bacteroidales_bacterium_ph8","Bifidobacterium_adolescentis","Bifidobacterium_angulatum","Bifidobacterium_catenulatum","Lachnospiraceae_bacterium_8_1_57FAA","Sutterella_wadsworthensis")
  
  hack_top_17 <- c("Faecalibacterium_prausnitzii","Bacteroides_uniformis","Odoribacter_splanchnicus","Fusicatenibacter_saccharivorans","Coprococcus_catus","Eubacterium_rectale","Oscillibacter_sp_57_20","Eubacterium_ramulus","Agathobaculum_butyriciproducens","Roseburia_inulinivorans","Roseburia_intestinalis","Ruminococcus_bromii","Roseburia_hominis","Alistipes_shahii","Eubacterium_eligens","Roseburia_faecis","Alistipes_putredinis","Parabacteroides_merdae","Eubacterium_ventriosum","Gemmiger_formicilis")
  
  MH_Species <- unique(c(hack_top_17,MH_Species))
  
  MN_Species <- c("Anaerotruncus_colihominis","Atopobium_parvulum","Bifidobacterium_dentium","Blautia_producta","candidate_division_TM7_single_cell_isolate_TM7c","Clostridiales_bacterium_1_7_47FAA","Clostridium_asparagiforme","Clostridium_bolteae","Clostridium_citroniae","Clostridium_clostridioforme","Clostridium_hathewayi","Clostridium_nexile","Clostridium_ramosum","Clostridium_symbiosum","Eggerthella_lenta","Erysipelotrichaceae_bacterium_2_2_44A","Flavonifractor_plautii","Fusobacterium_nucleatum","Gemella_morbillorum","Gemella_sanguinis","Granulicatella_adiacens","Holdemania_filiformis","Klebsiella_pneumoniae","Lachnospiraceae_bacterium_1_4_56FAA","Lachnospiraceae_bacterium_2_1_58FAA","Lachnospiraceae_bacterium_3_1_57FAA_CT1","Lachnospiraceae_bacterium_5_1_57FAA","Lachnospiraceae_bacterium_9_1_43BFAA","Lactobacillus_salivarius","Peptostreptococcus_stomatis","Ruminococcaceae_bacterium_D16","Ruminococcus_gnavus","Solobacterium_moorei","Streptococcus_anginosus","Streptococcus_australis","Streptococcus_gordonii","Streptococcus_infantis","Streptococcus_mitis","Streptococcus_sanguinis","Streptococcus_vestibularis","Subdoligranulum_sp_4_3_54A2FAA","Subdoligranulum_variabile","Veillonella_atypica")
  
  MH_Diversity <- diversity(data[,intersect(MH_Species,colnames(data))])
  MN_Diversity <- diversity(data[,intersect(MN_Species,colnames(data))])
  
  Weighted_MH_Diversity <- MH_Diversity * (length(intersect(MH_Species,colnames(data)))/length(MH_Species))
  
  Weighted_MN_Diversity <- MN_Diversity * (length(intersect(MN_Species,colnames(data)))/length(MN_Species))
  
  GMHI <- log(((Weighted_MH_Diversity+0.00001)/(Weighted_MN_Diversity+0.00001)),10)
  
  return(GMHI)
}