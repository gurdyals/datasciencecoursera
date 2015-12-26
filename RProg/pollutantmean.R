pollutantmean <- function(directory, pollutant, id = 1:332) {
##### pollutantmean <- function(directory = "specdata/", pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  st_TM = Sys.time()
  
  ##### directory = "specdata"
  ##### pollutant = "sulfate"
  
  print (id)
  files = dir(directory)
  ##### files = dir(directory, full.names = T)
  
  ##### class (files)
  ##### print ( files )
  ##### rbind(files)
  
  full_fn = paste ( directory, files [id], sep = "/" )
  ##### full_fn = files

  ##### print ( full_fn )
  
  df = read.csv( full_fn[1] )
  
  for_loop <- function ( df ) {
    for ( i in full_fn[2:length(full_fn)] ) {
      ##### print ( i )
      df_temp = read.csv(i)
      ##### print ( length(full_fn) )
      ##### print ( class(df_temp) )
      ##### print ( class(df) )
      ##### print (df_temp)
      ##### print ( nrow (df_temp) )
      ##### print ( nrow (df) )
      df <- rbind(df, df_temp)
    }
    ##### print (" Hello" )
    ##### print ( nrow(df) )
    ##### print ( nrow(df_temp) )
    print ( "In for_loop function" )
    df
    ##### return ( df )
  }
  
    print ( nrow (df) )
    print ( ncol (df) )
  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
    ##### i1 <- read.csv(directory/file)
    ##### i <- i1$sulfate
    ##### s <- !is.na(i1$sulfate)
    ##### mean_return <- mean(i[s])
  
  df_final = df[ df$ID == id[0], ]
  
  for_loop01 <- function ( df_final ) {
    for ( i in id[1]:id[length(id)] ) {
      ##### print ( i )
      ##### df_t = df [ df$ID == i, ]
      ##### print ( nrow(df_final) )
      ##### print ( nrow(df_t) )
      ##### print ( nrow(df_final) + nrow(df_t) )
    
      df_final = rbind ( df_final, df [ df$ID == i, ] )
      ##### print ( nrow(df_final) )
      ##### print ( nrow(df) )
      ##### print ("")
    }
    ##### return ( df_final )
    print ( "In for_loop01 function" )
    df_final
  }

  ##### df [ !is.na(df [ pollutant ]) & df$ID == 2, ]
  
  if ( length(id) > 1 ) {
    df <- for_loop( df )
    print ( nrow(df) )
    print ( "In if and for loops" )
  }

  df_final <- for_loop01( df_final )

  print ( nrow(df) )
  mean_df = mean ( df [ !is.na ( df[pollutant] ), pollutant ] )
  print ( nrow(df_final) )
  mean_final = mean ( df_final [ !is.na ( df_final[pollutant] ), pollutant ] )
  
  print ( mean_df )
  print ( mean_final )
  print ( directory )
  print ( pollutant )
  print ( id )
  print ( st_TM )
  nd_TM = Sys.time()
  print ( nd_TM )
  return ( mean_df )
}