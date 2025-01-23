# Miscellaneous scripts

library(fs)

# Define the source and destination directory paths
source_dir <- "~/fm_teaching/teaching_template/sessions-tab"
destination_dir <- "~/fm_teaching/teaching_template/surveys-tab"

# Copy and rename the directory
dir_copy(source_dir, destination_dir)
