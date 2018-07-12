# Downlaod the files and unzip them
# download.file(
#       "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip",
#       "./specdata.zip",
#       method = "curl"
# )
# unzip("./specdata.zip", exdir = ".")
#The function pollutantmean
library(data.table)
library(stringr)
pollutantmean <- function(directory = ".", pollutant, id = 1:332) {
      idchar <- str_pad(as.character(id), 3, pad = "0")
      name <- paste(idchar[[1]], ".csv", sep = "")
      dir <- paste(directory, "/", sep = "")
      data <- fread(paste(dir, name, sep = ""))
      idchar <- idchar[-1]
      for (c in idchar) {
            name <- paste(c, ".csv", sep = "")
            data <-
                  rbind(
                        data,
                        fread(paste(dir, name, sep = "")),
                        use.names = TRUE,
                        fill = TRUE,
                        idcol = NULL
                  )
      }
      mean2 <- mean(data[[pollutant]],na.rm = TRUE)
      mean2
}
