
# For Metaphlan Taxonomic Files
process_metaphlan_wide_table <- function(input_dir, script_path) {
  # List all *.txt files in the input_dir
  txt_files <- list.files(input_dir, pattern = "\\.txt$", full.names = TRUE)
  
  if (length(txt_files) == 0) stop("No .txt files found in the input directory.")
  
  output_file <- "merged_abundance.txt"
  
  # Delete if already exists
  if (file.exists(output_file)) file.remove(output_file)
  
  # Construct system command with full file list
  file_args <- paste(shQuote(txt_files), collapse = " ")
  merge_cmd <- sprintf("python %s %s -o %s", script_path, file_args, output_file)
  
  # Run the merge command
  system(merge_cmd)
  
  # Read the merged file
  if (!file.exists(output_file)) stop("Merged output file not found. Check merge script or input.")
  
  df_raw <- read.table(output_file, sep = "\t", header = TRUE, comment.char = "#", row.names = 1)
    return(df_raw)
}
process_species_abundance <- function(df) {
  # Remove the first column (taxonomy paths)
  taxonomy <- rownames(df)
  
  # Keep only rows that are species level: contain '|s__'
  species_rows <- grep("s__", taxonomy, value = FALSE)
  
  # Subset the dataframe to species rows only
  species_df <- df[species_rows, , drop = FALSE]
  
  # Clean row names: extract only species name
  rownames(species_df) <- sapply(strsplit(rownames(species_df), "\\|"), function(x) tail(x, 1))
  
  # Convert to numeric (if needed)
  species_df <- as.data.frame(lapply(species_df, as.numeric), row.names = rownames(species_df))
  rownames(species_df)<-gsub("s__","",rownames(species_df))
  species_df<-t(species_df)
  return(species_df)
}
read_taxonomic_file<-function(inp_dir="Metaphlan_taxnomic_files/",script="python_script/merge_metaphlan_tables.py"){
return(process_species_abundance(process_metaphlan_wide_table(input_dir = inp_dir,script_path = script)))
}


#FOR CSV
read_abundance_matrix <- function(file_path) {
  # Read the abundance matrix
  AB_M <- read.csv(file_path, stringsAsFactors = FALSE, check.names = FALSE)
  
  # Check if the first column is named 'Species' or similar
  if (!any(grepl("Species", colnames(AB_M), ignore.case = TRUE))) {
    stop("First column must contain species names and be labeled 'Species'")
  }
  
  # Clean species names and set as rownames
  rownames(AB_M) <- gsub("s__", "", AB_M[[1]])  # Remove s__ prefix
  AB_M <- AB_M[, -1]  # Remove the species column
  
  # Transpose the matrix
  AB_M <- t(AB_M)
  
  # Convert to data frame
  AB_M <- as.data.frame(AB_M)
  
  return(AB_M)
}


