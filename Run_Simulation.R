library(gen3sis)
datapath <- "Simulations"
sim <- run_simulation(
  config = file.path (datapath, "config","SouthAmerica","config_southamerica.R"),
  landscape = file.path(datapath, "landscape", "SouthAmerica"), 
  output_directory = "Output", 
  call_observer = 1,
  verbose = 1
  )
