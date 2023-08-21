library(yaml)
config <- yaml::read_yaml("C:\\project\\yamlCreate\\path.yml")
config$output_file$folder
config$output_file$file
paste(config$output_file$folder,  config$output_file$file, sep ="\\")

fn_file_create = function(var_file_path,var_dir_path){
  if (!dir.exists(var_dir_path))
  {
    dir.create(var_dir_path, recursive = TRUE)
    cat("Directry created")
    setwd(var_dir_path)
    if (!file.exists(var_file_path))
    {
      file.create(var_file_path)
      cat("File created")
    }
    else{
      cat("file already exists")
    }
  }
  else{
    setwd(var_dir_path)
    cat("directry already exists")
    if (!file.exists(var_file_path))
    {
      file.create(var_file_path)
      cat("File created")
    }
    else{
      cat("file already exists")
      
    }
  }
}

fn_file_create(config$output_file$file ,config$output_file$folder)

var_rollno = c()
var_name= c()
var_address= c()
var_phone_no = c()

fn_add_record <- function(var_rollno, var_name, var_address, var_phone_no) {
  
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

cat("Enter data for each variable (or press enter to stop): \n")
while (TRUE) {
  var_rollno <- as.integer(readline(prompt="Roll No: "))
  warning(FALSE)
  if (var_rollno == "") break
  var_name <- readline("Name: ")
  if (var_name == "") break
  var_address <- readline("Address: ")
  if (var_address == "") break
  var_phone_no <- (readline("Phone No: "))
  if (nchar(var_phone_no) == 10 ){
    var_phone_no = var_phone_no
  }
  else if(var_phone_no == "") break
  else break
  fn_add_record(var_rollno, var_name, var_address, var_phone_no)
}


fn_read_record = function(var_rollno) {
  read_list=read.table(file=paste(config$output_file$folder, config$output_file$file, sep ="\\"), header=FALSE, sep=",")
  filtered_list = read_list[read_list$V1 == var_rollno, ]
  return(filtered_list)
}
fn_read_record(2)

fn_read_all_records <- function() {
  read_list <- read.table(file = paste(config$output_file$folder, config$output_file$file, sep = "\\"), header = FALSE, sep = ",")
  return(read_list)
}
fn_read_all_records()





