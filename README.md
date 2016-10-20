# STRIPSSchulte

A repository for STRIPS data from the 
[Schulte lab](https://www.nrem.iastate.edu/landscape/content/people).

## Install R package

There are two options for installing the package 

  - install directly from github
  - clone the repository and then build the package
  
### Install directly from github

First, you will need to have the `devtools` package installed, i.e. 

    install.packages("devtools"))

Second, you need to create a 
[personal access token](https://github.com/blog/1509-personal-api-tokens). 
When creating this token, click the checkbox next to "repo" so that you will 
have the authorization necessary to push/pull from private repositories. 

Third, to install the package use

    devtools::install_github("jarad/STRIPSSchulte", auth_token = "XXXX")
    
where XXXX is your personal access token. 

### Clone the repository and then build the package

First 
[clone the repository](https://help.github.com/articles/cloning-a-repository/) 
and then 
[build the package](https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio).
