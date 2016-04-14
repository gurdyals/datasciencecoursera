complete <- function(directory, id = 1:332) {
  st_TM =   Sys.time()
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ##### rm(list = ls())
  
  ##### directory = "specdata"
  
  files = dir( directory, pattern = "*.csv", full.names = TRUE )
  ##### files
  
  #####
  ##### id = 7:14
  ##### idc = as.character(id)
  ##### print( idc )
  ##### for  ( i in 1:length(id) ) {
  #####   print (i)
  #####   if ( id[i] < 100 ) { 
  #####     idc[i] = paste0( "0", idc[i] )
  #####   }
  #####   if ( id[i] < 10 ) { 
  #####     idc[i] = paste0( "0", idc[i] )
  #####   }
  #####   print (id[i])
  #####   print (idc[i])
  ##### }
  ##### 
  
  fls <- files[id]

  df_out <- data.frame(id=id, nobs=c(0))
  df <- lapply(fls, read.csv)
  
  for ( i in 1:length(id) ) {
    print (id[i])
    s <- !is.na (df[[i]]$sulfate)
    n <- !is.na (df[[i]]$nitrate)
    uid <- unique (df[[i]]$ID)

    ##### print (s)
    ##### print (n)
    print (uid)
    print ( sum ( n & s ) )
    df_out$nobs[i] <- sum( n & s )
  }
  
  
  ##### idc = list(id)
  ##### s = as.logical(id)
    ##### n = as.logical(id)
    ##### idc[i - id[1] + 1] = paste0("df", i)
    ##### s7 = !is.na(df7$sulfate)
    ##### n7 = !is.na(df7$nitrate)

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  print ( df_out )
  print ( st_TM )
  print ( Sys.time() )
  df_out
}

# .st_TM <- Sys.time()
#######################################################################