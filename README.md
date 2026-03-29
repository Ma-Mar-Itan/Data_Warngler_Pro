# mypackage

`mypackage` is the packaged version of the **Data Wrangler Pro** Shiny app.

## Install

```r
install.packages(c("shiny", "bslib", "DT", "dplyr", "fs", "ggplot2", "readr", "rlang"))
# optional parquet support
install.packages("arrow")

# from local checkout
devtools::install(".")
```

## Run

```r
mypackage::run_app()
```

## Development workflow

```r
devtools::load_all()
run_app()

testthat::test_dir("tests/testthat")
```

## Migration summary

The prior script-oriented app layout (`app.R`, `ui.R`, `server.R`, `global.R`, `modules/`, and `utils/`) has been migrated to:

- `R/app_ui.R` (`app_ui()`)
- `R/app_server.R` (`app_server()`)
- `R/run_app.R` (`run_app()`)
- `R/mod_*.R` module functions
- `R/utils_*.R` helper and pipeline code
- `inst/app/www/` static assets served via package-safe resource paths

No runtime `source()` chains are used.
