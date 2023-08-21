library(yaml)
config <- yaml::read_yaml("C:\\project\\path.yml")
print(config$output_file$file)


