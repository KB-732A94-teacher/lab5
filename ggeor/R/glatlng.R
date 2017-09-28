# Google Geocode API
# API Key: &key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w
#
# Standard Usage Limits
# Users of the standard API:
# 2,500 free requests per day, calculated as the sum of client-side and server-side queries.
# 50 requests per second, calculated as the sum of client-side and server-side queries.
#
# https://maps.googleapis.com/maps/api/geocode/json?address=

#'@title glatlng
#'@description Returns address of the given latitude and longitude.
#'@param latlng Character class of latitude and longitude separated by ,
#'@export
#'@import jsonlite curl
#'@return Character class of the address of the given latitude and longitude.
#'@examples 
#'glatlng("37.56654, 126.978")
#'glatlng("37.55723, 127.0453")

glatlng <- function(latlng) {
  
  stopifnot(is.character(latlng))
  
  latlng <- gsub(" ","", latlng)
  
  g_url <- "https://maps.googleapis.com/maps/api/geocode/json?latlng="
  key <- "&key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w"
  g_data <- jsonlite::fromJSON(paste0(g_url, latlng, key))
  
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
    #printing input latitude and longitude
    cat("Input latitude and longitude: ", latlng,"\n\n")
    
    #summary of the info
    address <- g_data$results[[2]][1]

    return(address)
  } 
}