# Miscellaneous scripts

library(fs)

# Define the source and destination directory paths
source_dir <- "~/fm_teaching/teaching_template/sessions-tab"
destination_dir <- "~/fm_teaching/teaching_template/surveys-tab"

# Copy and rename the directory
dir_copy(source_dir, destination_dir)

# Terminal scripts
# quarto render
# git add . && git commit -m "Add git steps2" && git push
# git config --global credential.helper cache

# > gitcreds::gitcreds_set()
# 
# ? Enter password or token: ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# -> Adding new credentials...
# -> Removing credentials from cache...
# -> Done.