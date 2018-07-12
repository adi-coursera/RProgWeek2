library(data.table)
library(stringr)
complete <- function(directory, id = 1:332) {
      idchar <-
            str_pad(as.character(id), 3, pad = "0") #Making the integer id into a string with the right padding
      csvlist <- paste(idchar, ".csv", sep = "") #Creating "id.csv"
      completeframe <- data.table()
      for (c in csvlist) {
            path <- paste(paste(directory, "/", sep = ""), c, sep =
                                "") #Creating "directory/c.csv
            completeframe <-
                  rbind(completeframe, list(
                        id = as.integer(substr(c, 1, 3)),
                        nobs = dim(na.exclude(fread(path)))[[1]]
                  ))
      }
      completeframe
}