# Copyright (c) 2020, ETH Zurich

#' trait_homogenization_random_mutation.R
#'
#' @param trait_evolutionary_power the amount of change per mutaiton
#'
#' @noRd
trait_homogenization_random_mutation <- function(trait_evolutionary_power) {
  # browser()
  force(trait_evolutionary_power)
  trait_homogenization_random_mutation_internal <- function(species, cluster_indices, landscape, config) {
    
    # browser()
    length_cluster <- length(cluster_indices)
    traits_clusters <- split(as.data.frame(species[["traits"]]), cluster_indices)
    abundance_clusters <- split(species[["abundance"]], cluster_indices)
    
    # browser()
    par(mfrow=c(1,2))
    hist(unsplit(traits_clusters, cluster_indices)$'temp', main="before")
    
    
    traits_clusters <- mapply(config$user$tr.homogenize,
                              traits_clusters,
                              abundance_clusters,
                              MoreArgs = list(
                                tr_names = config$gen3sis$general$trait_names,
                                config = config),
                              SIMPLIFY = FALSE
    )
    
    hist(unsplit(traits_clusters, cluster_indices)$'temp', main="after")
    
    NEW_clu_tr_spi <- unsplit(traits_clusters, cluster_indices)
    
    # converting traits from data.frame into matrix (alternative would be bypass split dependency on data.frame)
    NEW_clu_tr_spi <- as.matrix(NEW_clu_tr_spi)
    traits <- species[["traits"]]
    mutation_deltas <-rnorm(length(traits[, "temp"]), mean=0, sd=trait_evolutionary_power)
    traits[, "temp"] <- traits[, "temp"] + mutation_deltas #evt. erhöhen
      #traits[, "prec"] <- traits[, "prec"] + rnorm(length(traits[, "prec"]), mean = 0, sd =0.001) #evt. erhöhen
      return(invisible(traits))
  }
  return(invisible(trait_homogenization_random_mutation_internal))
}

tr.homogenize <- function(clu_tr_spi_x, abundance, tr_names, config){
  # updating eco (traits and abundance.... here I homegenize the traits per cluster!)
  # clu_tr_spi_x is one of the lists of the geo_cluster of the species
  
  # browser(text="inside tr.homogenize")
  print("HOOOOOOP")
  force(vals)
  browser()
  nrow_clu_tr_spi_x <- nrow(clu_tr_spi_x)
  clu_tr_spi_x <- as.matrix(clu_tr_spi_x)
  #if (nrow_clu_tr_spi_x>1) { #check if more than one line
  mean_abd <- mean(abundance)
  
  weight_abd <- abundance/mean_abd
  hom_clu_tr_spi <- colMeans(clu_tr_spi_x[,tr_names, drop=F]*weight_abd)
  
  return(as.data.frame(clu_tr_spi_x))
}