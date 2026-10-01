# Contributing

1. Put reusable functions in `R/`.
2. Put a numbered analysis record in `analysis/`.
3. Register input and output paths in `_targets.R`.
4. Do not commit private data, PDFs, secrets or generated caches.
5. Run `targets::tar_make()` and `quarto::quarto_render()` before merging.
