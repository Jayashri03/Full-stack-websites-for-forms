
#* adds record into file
#* @get /add-record
#* @param var_rollno enter roll number
#* @param var_name enter name
#* @param var_address enter address
#* @param var_phone_no enter phone number



fn_add_record <- function(var_rollno, var_name, var_address, var_phone_no) {
  
  library(yaml)
  config <- yaml::read_yaml("C:\\project\\yamlCreate\\path.yml")
  
  
  if (file.exists(paste(config$output_file$folder, config$output_file$file, sep = "\\")) &&
      file.size(paste(config$output_file$folder, config$output_file$file, sep = "\\")) > 0) {
    
    file_contents <- read.table(file = paste(config$output_file$folder, config$output_file$file, sep = "\\"), header = FALSE, stringsAsFactors = FALSE)
    
    if (var_rollno %in% file_contents$V1) {
      cat("Record already exists!\n")
    } else {
      
      new_row <- data.frame(var_rollno, var_name, var_address, var_phone_no, stringsAsFactors = FALSE)
      write.table(x = new_row, file = paste(config$output_file$folder, config$output_file$file, sep = "\\"), append = TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
      cat("Record added successfully!\n")
    }
    
  } else {
    new_row <- data.frame(var_rollno, var_name, var_address, var_phone_no, stringsAsFactors = FALSE)
    write.table(x = new_row, file = paste(config$output_file$folder, config$output_file$file, sep = "\\"), append = FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
    cat("Record added successfully!\n")
  }
}

#* reads records of particular roll number
#* @get /read-selected-records
#* @param var_rollno enter any rollno

fn_read_record = function(var_rollno) {
  
  library(yaml)
  config <- yaml::read_yaml("C:\\project\\yamlCreate\\path.yml")
  
  read_list=read.table(file=paste(config$output_file$folder, config$output_file$file, sep ="\\"), header=FALSE, sep=",")
  filtered_list = read_list[read_list$V1 == var_rollno, ]
  return(filtered_list)
}

#* read all records in a file
#* @get /read-all-records

fn_read_all_records <- function() {
  library(yaml)
  config <- yaml::read_yaml("C:\\project\\yamlCreate\\path.yml")
  
  read_list <- read.table(file = paste(config$output_file$folder, config$output_file$file, sep = "\\"), header = FALSE, sep = ",")
  return(read_list)
}

