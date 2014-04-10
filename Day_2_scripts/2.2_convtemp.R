convTemp<-function(t=0,unit="c"){ # convTemp is defined as a new user function requiring two arguments, t and unit, the default values are 0 and "c", respectively.
  
  if ( !is.numeric(t) ) stop("Non numeric temperature entered")
  
  if ( !(unit %in% c("c","f"))){
    stop("Unrecognized temperature unit. Enter (c)entigrade or (f)ahrenheit.")
  }
  
  converted<-0
  
  # Conversion for centigrade
  if ( unit=="c" ) {
    converted <- 9/5 * t + 32
  }
  
  # Conversion for Fahrenheit
  if(unit=="f"){
    converted <- 5/9 * (t-32)
  }
  
  converted
}