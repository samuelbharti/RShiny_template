# Load modules
sapply(list.files("modules", full.names = TRUE), function(x) source(x))
# Load user interface
sapply(list.files("userInterface", full.names = TRUE), function(x) source(x))
