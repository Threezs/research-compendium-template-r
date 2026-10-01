library(targets)
library(tarchetypes)

tar_option_set(
  packages = c("readr", "dplyr", "yaml"),
  format = "rds",
  error = "abridged"
)

tar_source("R")

list(
  tar_target(project_config, yaml::read_yaml("config/project.yml")),
  tar_target(metadata_file, "data/mock/sample_metadata.csv", format = "file"),
  tar_target(metadata, readr::read_csv(metadata_file, show_col_types = FALSE)),
  tar_target(measurement_file, "data/mock/measurements.csv", format = "file"),
  tar_target(measurements, readr::read_csv(measurement_file, show_col_types = FALSE)),
  tar_target(clean_metadata, standardize_names(metadata)),
  tar_target(summary_table, summarize_measurements(measurements, clean_metadata)),
  tar_target(summary_csv, write_summary(summary_table, "outputs/mock_summary.csv"), format = "file")
)
