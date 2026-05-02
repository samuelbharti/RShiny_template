source_dir <- function(path) {
	if (!dir.exists(path)) {
		return(invisible(NULL))
	}

	files <- list.files(path, pattern = "\\.[Rr]$", full.names = TRUE)
	files <- sort(files)

	lapply(files, source)
	invisible(files)
}

# Load modules and page-level UI definitions.
source_dir("modules")
source_dir("userInterface")
