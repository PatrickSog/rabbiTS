#'@title ts_mean
#'@description A function that calculates the maximum value of each raster layer
#'@return numeric value
#'@examples mean<-ts_mean(my_input)
#'@details Function will take .tif raster data and calculate the mean for each layer


ts_mean<-function(my_input){

  # create raster stack
  file_list <- list.files(my_input, pattern = "*.tif$")
  #file_list

  # stack raster layers
  
  for (i in 1:length(file_list)){
    if (i == 1){
      # for the first run define our final raster file ...
      current_layer <- raster(file_list[i])
      # remove the raster in case it already exists to avoid duplicate entries
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

  val_min <- (cellStats(in_stack, stat='mean'))
  
  return(val_mean)
  
}