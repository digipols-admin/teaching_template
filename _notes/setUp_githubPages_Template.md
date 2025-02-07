# Workflow for Building a Quarto Website in R and Hosting it on GitHub Pages

# Overview
This document describes how to create a Quarto website template in Git hub and R

# 1) Create a website template

## Step 1: Set Up a GitHub Repository (repo)
- This step is performed via the GitHub website and not in R.
- Choose a name for your repo, the website project. Consider first making the repo a template, so that it can be easily reused to create more websites.
- Once you've create a repo (whether as a template or as a working repo) stay on the repo page, we will use some of the "Quick set up" code later in the R Terminal.

## Step 2: Develop the Quarto Website Locally
- Create a new Quarto project. Since it's a website, select the create Quarto website option.
- Create an empty "docs" and an empty "images" folder. These will be needed for compiling the website and adding images if required
- Adjust the YML header so that the project .yml file specifies output to docs, like this:

```
project:
  type: website
  output-dir: docs
```

- Develop the website locally on R. If you are developing a template to reuse add some pages and typical features you would like for a template. 
- When the website template is ready find, the "Build" tab, and press Render Website.

## Step 3: In R, initialize a Git Repository and Push to GitHub
- Install or load the `usethis` library.

```
library(usethis)
use_git_config(user.name = "you-username", 
               user.email = "your=email")
```               

- Go the RStuido Terminal or open in Tools. 
- In the Terminal you will initialise git, add files and do a first commit by pasting this code:
```
git init
git add .
git commit -m "first commit"
```

Copy the lines of code from this part of the open Github webpage and paste into Terminal:
"…or push an existing repository from the command line"

Alternatively run this in terminal
- Link the local repository to the GitHub repository:
```
git remote add origin https://github.com/your-username/your-repository.git 
```
- Push the commit to GitHub (use master):
```
git push -u origin main 
```
- You will probably be prompted for the username and password, so have your git PAT authorization token at hand to use as the password when prompted.

## Step 4: Activate, Set Up GitHub Pages to render website
- In the git hub website make sure you are in the relevant repo and go to Settings, then choose Pages from left panel.
- Under Branch, change setting from 'None' to 'Main', then change '/root' to 'docs. Save changes. In few minutes the website should be running

## Step 5: Make the Repository a Template (Optional)
- Mark the repository as a template in the GitHub repo settings. This way you can reuse the template for creating websites.


# 2) Use a GitHub template

## Step 1: Create New Projects Using the Template
- In GitHub go to the repo that is the template. Click on 'Use this template' to create a new repos. Or go to create "New" repository.

## Step 2: Clone repo to R
- To clone on RStudio, I will assume you are logged in to a different R project. 
- Create an empty folder with the EXACT same name as the GitHub repo, then:
- Open R terminal and navigate to the directory where you want the new project:
```
cd ~/new-project-directory
```
- To clone the new repository: Note there should be a space and period at the end to tell R not to duplicate the folder
```
git clone https://github.com/YOUR-USERNAME/YOUR-NEW-REPO.git .
```
- If the above code does not work, it could be because of private settings. Try this, where the PAT code should be pasted, remember to leave gap and period.
```
git clone https://YOUR-USERNAME:ADD_YOUR_PAT_HERE@github.com/YOUR-USERNAME/YOUR-NEW-REPO.git .
```

## Step 3: Configure website settings in GitHub pages
- It is likely you will need to activate Git Hub pages. This means repeating the step above:
"Step 4: Activate, Set Up GitHub Pages to render website"

## Step 4: Work on your website in R/Quarto
- Go into your new project in R (this will mean logging out of your current R project)
- Work on your website
- Remember to "Build" website in R before commiting changes to GitHub 
- Regularly commit and push changes to GitHub.


# Notes

If you do not want to use a template, simply follow steps 1 to 4 above and do not make the Repo a template. 

Although the focus of this document was a website. The same logic can be applied to any type of resource, e.g. a template for a report, or for a book.