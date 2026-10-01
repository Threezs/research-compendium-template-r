standardize_names <- function(x) {
  names(x) <- tolower(gsub("[^A-Za-z0-9]+", "_", names(x)))
  x
}

summarize_measurements <- function(measurements, metadata) {
  stopifnot("sample_id" %in% names(measurements))
  sample_cols <- setdiff(names(measurements), c("gene_id", "sample_id"))
  out <- data.frame(
    variable = sample_cols,
    mean = vapply(measurements[sample_cols], mean, numeric(1), na.rm = TRUE),
    sd = vapply(measurements[sample_cols], sd, numeric(1), na.rm = TRUE)
  )
  out
}

write_summary <- function(x, path) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  readr::write_csv(x, path)
  path
}
