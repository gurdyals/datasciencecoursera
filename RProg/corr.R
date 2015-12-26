corr <- function(directory, threshold = 0) {
  ##### rm (list = ls())
  st_TM <- Sys.time()
  ##### directory = "specdata"
  ##### threshold = 150
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  files <- dir(directory, pattern = "*.csv", full.names = TRUE)
  ##### df <- data.frame()
  ##### for ( file in files ) {
  ##### df <- rbind(df, read.csv(file))
  ##### }
  ##### Date    <- !is.na(df$Date)
  ##### sulfate <- !is.na(df$sulfate)
  ##### nitrate <- !is.na(df$nitrate)
  ##### ID      <- !is.na(df$ID)
  ##### sum ( Date )
  ##### sum ( sulfate )
  ##### sum ( nitrate )
  ##### sum ( ID )
  ##### sum ( Date & sulfate & nitrate & ID )
  ##### cor(sulfate, nitrate)
  
  df <- lapply(files, read.csv)
  Date    <- list()
  sulfate <- list()
  nitrate <- list()
  ID      <- list()
  totl    <- list()
  cr      <- list()
  
  cr_out <- rep(0, length(df))
  ##### cr_out
  ##### class(cr_out)
  ##### cr_out[1] = 1
  
  i = 0
  
  for ( index in 1:length(df) ) {
    print ( "Index" )
    print ( index )

    ##### df_t <- df[[index]]
    ##### print ( nrow(df_t) )
    ##### print ( ncol(df_t) )
    ##### Date[[index]]    <- !is.na(df[[index]]$Date)
    ##### sulfate[[index]] <- !is.na(df[[index]]$sulfate)
    ##### nitrate[[index]] <- !is.na(df[[index]]$nitrate)
    ##### ID[[index]]      <- !is.na(df[[index]]$ID)
    ##### totl[[index]]    <- Date[[index]] & sulfate[[index]] & nitrate[[index]] & ID[[index]]
    ##### cr[[index]]    <- cor(sulfate[[index]], nitrate[[index]])
    
    totl[[index]]    <- ( !is.na(df[[index]]$Date) & !is.na(df[[index]]$sulfate) & !is.na(df[[index]]$nitrate) & !is.na(df[[index]]$ID) )
    Date[[index]]    <- df[[index]]$Date
    sulfate[[index]] <- df[[index]]$sulfate
    nitrate[[index]] <- df[[index]]$nitrate
    ID[[index]]      <- df[[index]]$ID
    
    cr[[index]]    <- cor(sulfate[[index]][totl[[index]]], nitrate[[index]][totl[[index]]])
    
    ##### print ( Date[[index]] )
    ##### print ( sulfate[[index]] )
    ##### print ( nitrate[[index]] )
    ##### print ( ID[[index]] )
    
    print ( sum ( totl[[index]] ) )
    print ( threshold )

    if ( sum (totl[[index]] ) > threshold ) {
        print ( cr[[index]] )
        i = i + 1
        cr_out[i] <- cr[[index]]
      }
    
    #    print ( sum ( Date[[index]] ) )
    #    print ( sum ( sulfate[[index]] ) )
    #    print ( sum ( nitrate[[index]] ) )
    #    print ( sum ( ID[[index]] ) )
    #    print ( sum ( Date[[index]] & sulfate[[index]] & nitrate[[index]] & ID[[index]] ) )
    #    print ( threshold )
  }
  
  cr_out
  print ( length(cr_out) )
  print ( class ( cr_out ) )
  
  ##### Date    <- !is.na(df$Date)
  ##### sulfate <- !is.na(df$sulfate)
  ##### nitrate <- !is.na(df$nitrate)
  ##### ID      <- !is.na(df$ID)
  ##### sum ( Date )
  ##### sum ( sulfate )
  ##### sum ( nitrate )
  ##### sum ( ID )
  ##### sum ( Date & sulfate & nitrate & ID )
  ##### cor(sulfate, nitrate)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  cr_fin <- cr_out[0]
  
  ##### cr_fin <- cr1[0]
  ##### class(cr_fin)
  ##### length(cr_fin)
  
  ##### cr1 <- rep(0, 332)
  ##### cr1
  ##### sum(cr1)
  
  ##### i = sum( !is.na(cr_out))
  i = sum( cr_out != 0 )
  if ( i > 0 ) {
    cr_fin <- cr_out[1:i]
  }
  
  print ( cr_fin )
  print ( i )
  print ( length(cr_fin) )
  
  print ( st_TM )
  print ( Sys.time() )
  
  cr_fin
}

##### for ( i in 1:332 ) {
#####   if (!is.na(cr[[i]])) {
#####     print ( i )
#####     print ( cr[[i]] )
#####     }
#####   }
