library(data.table)
library(stringr)
corr <- function(directory, threshold = 0) {
      csvlist <-
            paste(str_pad(as.character(1:332), 3, pad = "0"), ".csv", sep = "")
      dir <- paste(directory, "/", sep = "")
      pathlist <- paste(dir, csvlist, sep = "")
      list <- numeric()
      for (i in 1:332) {
            if (complete(directory = directory, i)[[2]] >= threshold) {
                  data <- fread(pathlist[[i]])
                  list <-
                        c(list,
                          cor(data$sulfate, data$nitrate, use = "complete.obs"))
            }
      }
      list
}