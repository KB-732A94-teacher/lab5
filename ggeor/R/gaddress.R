# Google Geocode API
# API Key: &key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w
#
# Standard Usage Limits
# Users of the standard API:
# 2,500 free requests per day, calculated as the sum of client-side and server-side queries.
# 50 requests per second, calculated as the sum of client-side and server-side queries.
#
# https://maps.googleapis.com/maps/api/geocode/json?address=

#'@title gaddress
#'@description Returns latitude and longitude of the given input location.
#'@param address Character class of location address
#'@export
#'@return A data.frame contains address, latitude and longitude of given location.
#'@examples 
#'gaddress("37.56654, 126.978")
#'gaddress("37.55723, 127.0453")

gaddress <- function(address) {
  
  library(jsonlite)
  
  #address transform
  address <- gsub(" ","+", address)
  
  g_url <- "https://maps.googleapis.com/maps/api/geocode/json?address="
  key <- "&key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w"
  g_data <- fromJSON(paste0(g_url, address, key))
  
  if(g_data$status == "ZERO_RESULTS"){
    stop(print("No results found"))
  }
  else if(g_data$status == "OVER_QUERY_LIMIT") {
    stop(print("Over usage limits"))
  } 
  else if(g_data$status == "REQUEST_DENIED") {
    stop(print("Request denied"))
  } 
  else if(g_data$status == "INVALID_REQUEST") {
    stop(print("Query might be missing"))
  } 
  else if(g_data$status == "UNKNOWN_ERROR") {
    stop(print("Unknown error"))
  } 
  
  if(g_data$status == "OK"){
    #printing input address
    cat("Input address: ", address,"\n\n")
    
    #summary of the info
    lat = g_data$results[[3]]$location$lat
    lng = g_data$results[[3]]$location$lng
    
    info <- data.frame(address, lat, lng, stringsAsFactors=FALSE)
    
    return(info)
  } 
}