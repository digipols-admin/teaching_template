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

# Usethis
library(usethis)
# usethis set up for github
use_git_config(user.name = "digipols-admin", 
               user.email = "admin@digipols.com")
use_github(remote = "origin", auth_token = "ADD_PAT_TOKEN_HERE", private = FALSE)

# Googledrive code
# Load libraries and initiate ----------------------------------------------------------
library(tidyverse)
library(googledrive)
library(here)

# Initiate drive
drive_auth()

# Check it works
drive_find(n=3)


# Set IDs and names -------------------------------------------------------

# Set the ID of the parent folder where the new project structure should be created
# find the correct folder id
parent_folder_id <- "1oPtz7oLJizAsn5NJ8O2ygONYZNXzk75R"  # Use as_id to specify the ID

# Replace 'Project_name' with your actual project name
project_name <- "data_analysis"


# Set functions ---------------------------------------------------------------

# Function to create a subfolder within the specified path
create_subfolder <- function(path, subfolder_name) {
  # Create the subfolder
  subfolder <- drive_mkdir(name = subfolder_name, path = path)
  return(subfolder)
}

# Function to create an empty Google Doc within the specified path
create_google_doc <- function(path, doc_name) {
  # Create the empty Google Doc
  google_doc <- drive_create(
    name = doc_name,
    type = "document",
    path = as_id(path) # Specify the ID of the parent folder
  )
  return(google_doc)
}


# Create folder and files -------------------------------------------------

# Create the main project folder within the specified parent folder
main_folder <- drive_mkdir(name = project_name, path = as_id(parent_folder_id))

# Create subfolders and nested subfolders
data_folder <- create_subfolder(main_folder$id, "data")
data_raw_folder <- create_subfolder(data_folder$id, "data_raw") # Subfolder inside 'data'
data_processed_folder <- create_subfolder(data_folder$id, "data_processed") # Subfolder inside 'data'
scripts_folder <- create_subfolder(main_folder$id, "scripts")
exploratory_folder <- create_subfolder(main_folder$id, "exploratory")
doc_folder <- create_subfolder(main_folder$id, "doc")
literature_folder <- create_subfolder(doc_folder$id, "literature") # Subfolder inside 'doc'

# Create EMPTY README files
#readme_doc <- create_google_doc(main_folder$id, "README")
readme_doc <- create_google_doc(exploratory_folder$id, "README")
readme_doc <- create_google_doc(scripts_folder$id, "README")
readme_doc <- create_google_doc(doc_folder$id, "README")
readme_doc <- create_google_doc(data_folder$id, "README")


# Upload a specific docxs as the general README ---------------------------------------------------

# Path to the .docx file you want to upload
docx_file_path <- "/home/fernando/generic_scripts/README_home.docx"
# Name of the file as you want it to appear in Google Drive
file_name_in_drive <- "README"

# Upload the .docx file and convert to Google Doc
drive_upload(
  media = docx_file_path,
  name = file_name_in_drive,
  parents = as_id(main_folder$id), # Specify the ID of the parent folder
  type = "document"
)





# Summary -----------------------------------------------------------------

# Generic script for creating project directory in google drive
# Requires google authorization

# Load libraries and initiate ----------------------------------------------------------
library(tidyverse)
library(googledrive)
library(here)
# Initiate drive
drive_find(n=3)


# Set IDs and names -------------------------------------------------------

# Set the ID of the parent folder where the new project structure should be created
# find the correct folder id
parent_folder_id <- "1rnx5XMXVR_78l75zEXiaDZIAVx4Pq52x"  # Use as_id to specify the ID

# Replace 'Project_name' with your actual project name
project_name <- "es_2023_ptv"


# Set functions ---------------------------------------------------------------

# Function to create a subfolder within the specified path
create_subfolder <- function(path, subfolder_name) {
  # Create the subfolder
  subfolder <- drive_mkdir(name = subfolder_name, path = path)
  return(subfolder)
}

# Function to create an empty Google Doc within the specified path
create_google_doc <- function(path, doc_name) {
  # Create the empty Google Doc
  google_doc <- drive_create(
    name = doc_name,
    type = "document",
    path = as_id(path) # Specify the ID of the parent folder
  )
  return(google_doc)
}


# Create folder and files -------------------------------------------------

# Create the main project folder within the specified parent folder
main_folder <- drive_mkdir(name = project_name, path = as_id(parent_folder_id))

# Create subfolders and nested subfolders
data_folder <- create_subfolder(main_folder$id, "data")
data_raw_folder <- create_subfolder(data_folder$id, "data_raw") # Subfolder inside 'data'
data_processed_folder <- create_subfolder(data_folder$id, "data_processed") # Subfolder inside 'data'
scripts_folder <- create_subfolder(main_folder$id, "scripts")
exploratory_folder <- create_subfolder(main_folder$id, "exploratory")
doc_folder <- create_subfolder(main_folder$id, "doc")
literature_folder <- create_subfolder(doc_folder$id, "literature") # Subfolder inside 'doc'

# Create EMPTY README files
#readme_doc <- create_google_doc(main_folder$id, "README")
readme_doc <- create_google_doc(exploratory_folder$id, "README")
readme_doc <- create_google_doc(scripts_folder$id, "README")
readme_doc <- create_google_doc(doc_folder$id, "README")
readme_doc <- create_google_doc(data_folder$id, "README")


# Upload specific docxs ---------------------------------------------------

# Path to the .docx file you want to upload
docx_file_path <- "/home/fernando/generic_scripts/README_home.docx"
# Name of the file as you want it to appear in Google Drive
file_name_in_drive <- "README"

# Upload the .docx file and convert to Google Doc
drive_upload(
  media = docx_file_path,
  name = file_name_in_drive,
  parents = as_id(main_folder$id), # Specify the ID of the parent folder
  type = "document"
)


# Scrap -------------------------------------------------------------------

# Path to the local file you want to upload
file_path <- here("R/svr_01.R")

# Name of the file as you want it to appear in Google Drive
file_name_in_drive <- "svr.R"

# Location of drive folder
parent_id="1yGC6LR2cXea2TO4gpSSbtt5__s8RwtOB"

# Upload the .docx / file and convert to Google Doc
drive_upload(
  media = file_path,
  name = file_name_in_drive,
  parents = as_id(parent_id) # Specify the ID of the parent folder
  #type = "csv"
)

# Path to the local file you want to upload
file_path <- here("TODO.md")

# Name of the file as you want it to appear in Google Drive
file_name_in_drive <- "TODO.md"

# Location of drive folder
parent_id="1rnx5XMXVR_78l75zEXiaDZIAVx4Pq52x"

# Upload the .docx / file and convert to Google Doc
drive_upload(
  media = file_path,
  name = file_name_in_drive,
  parents = as_id(parent_id) # Specify the ID of the parent folder
  #type = "csv"
)
