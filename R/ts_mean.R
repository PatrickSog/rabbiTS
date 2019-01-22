#'@title ts_mean
#'@description A function that calculates the maximum value of each raster layer
#'@return numeric value
#'@examples mean<-ts_mean()
#'@details Function will get the current working directory and use all raster files in this directory to calculate

ts_mean<-function(){
  # libraries
  
  library(raster)
  
  my_path <- getwd()
  # create raster stack
  file_list <- list.files(my_path)
  #file_list
  
  # stack raster layers
  
  for (i in 1:length(file_list)){
    if (i == 1){
      # for the first run define our final raster file ...
      current_layer <- raster(file_list[i])
      # remove the raster in case it already exists to avoid duplicate entries
      rm(in_stack)
      in_stack <- raster(current_layer)
    } else {
      # ... and fill it with each additional run with another layer
      current_layer <- raster(file_list[i])
      in_stack <- stack(in_stack, current_layer)
      # Delete all variables except for the raster stack "my_raster"
      rm(i, current_layer)
    }
  }
  
  ##############
  #plot(in_stack)
  #class(in_stack)
  
  # calculate mean

  val_mean <- (cellStats(in_stack, stat='mean'))
  
  return(val_mean)
  
}

