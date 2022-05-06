# from https://github.com/rstudio/bookdown/blob/master/R/utils.R
UOAdown_file <- function(...) {
  system.file(..., package = 'UAOdown', mustWork = TRUE)
}

# from https://github.com/rstudio/bookdown/blob/master/R/skeleton.R
UOAdown_skeleton <- function(path = getwd()) {

  # ensure directory exists
#  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources <- UOAdown_file('rstudio', 'templates', 'project', 'resources')

  R.utils::copyDirectory(from = resources,
                         to = path,
                         recursive = TRUE)
}
