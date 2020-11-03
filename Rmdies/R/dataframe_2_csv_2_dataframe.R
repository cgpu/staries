# Preview dataframe to write beforehands:
head(my_fav_df)

# Check dimensions of the dataframe you wish to write in a .csv file:
dim(my_fav_df)


# Set path of (i)output directory (ii) filename:
savedir    = "home/cgpu/favorite_dir/"
FILE = paste0(savedir,  'favorite_filename', '.csv')

# Write dataframe into .csv file
write.table( my_fav_df,  
            file      = FILE,
            append    = FALSE, 
            quote     = FALSE, 
            sep       = ",",
            row.names = F,
            col.names = T)


# Reload the file to check column names and all are good:
temp_df <- read.csv(FILE, 
                    header           = TRUE, 
                    stringsAsFactors = FALSE, 
                    check.names      = FALSE); 

# check dimensions of csv file // This should be `TRUE`: dim(temp_df) == dim(my_fav_df)
dim(temp_df)

# Preview dataframe, check if written correctly 
# Common suspects for trouble: header not written, header converted to row, first column converted to rownames, etc/
head(temp_df)
