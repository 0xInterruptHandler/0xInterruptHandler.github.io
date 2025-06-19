---
title: Control de versiones
date: '2025-02-18 11:17:32'
comments: true
categories: [Development Tools]
tags:  [git, control-versiones, vcs]
---


# Version COntrol
> system that records all changes and modification in files for tracking purposes. Version control is the term given to the system used to keep a detailed record of all changes to the codebase.    
> it allows developers to access the histroty with the ability to go revert and roll back.

## Applications of Version Control:
* revise history 
* collabotation
* efficiency
* identity
* automation

## Types of Version Control
* Centralized  (`Concurrent Version System`, `Subversion`)
* Distributed (`Mercurial`, `Git`)

## Staging 
> The staging environment should mimic your production environment. it is useful for adding new features, testing, configuring changes etc. The closer the staging environment is to your production, the more accurate your testing is going to be.

## Production
> Production is live where people can see and interact with it.

# Basic Bash Commands
| Command | Used for                                                                     |
| ------- | ---------------------------------------------------------------------------- |
| cd      | Change Directory                                                             |
| ls      | List command used for showing the content of a directory.                    |
| rm      | Remove command used for removing a file or a directory                       |
| mv      | Used to move files or folders to another location                            |
| touch   | Allows creating of a new empty file or to upate a timestamp on a file        |
| cp      | Used to make a copy of a file or foldler                                     |
| mkdir   | Make a new directory                                                         |
| pwd     | Print work directory, shows the current location in the shell                |
| cat     | Allows reading or concatenation of a file                                    |
| less    | Displays the contents of a file one page at a time.                          |
| grep    | Global regular expression, allows for searching contents of files or folders |


# Pipes
> When working with the command line, you can use pipes to combine commands together. Pipes allows to pass the output of one command as the input of another command.
```bash
ls | wc -w
cat file.txt | wc -w
```

# Redirection
> there are three types of redirections.
* **Standard Input**: The standard input redirection gives you the option to record your input and save it to a file either by overwriting or appending the file. It is represented by `<` and its code is `0`.
```bash
cat > text.txt
## this is a sadh dash dash
cat < text.txt
## returns the content
```
* **Standard Output**: The redirection standard output allow you to control where the output goes. It is represented by `>` and its code is `1`.
```bash
ls -l > output.txt
```
* **Standard Error**: The standard error redirect allows you to specify that the error should be written to a file. It is represented by `2>` and its code is `2`.
```bash
ls -l 2> error.txt
ls -l 2> output_error.txt 2>&1
```


# Git 
> Git is a version control system designed to help users keep track of changes to files within their projects.
## Advantages
* speed
* reliability
* free and open-source 
* accessible syntax

# Github
> GitHub is a Cloud-based hosting service that lets you manage Git repositories from a user interface.
## Major Features:
* Access Control
* Pull Rqquest
* Automation

## Git Workflow
> There are three stations in git workflow

`Modify` *-- git add -->* `Commit/Stage` *-- git commit -->* `Committed`


`git status`: check for any update or modifications in the local machine.
`git add <filename>`: add the file to the commit
`git restore --stage <filename>`: restored added file from commit.
`git log --merge`: show the merge log
`git log -p <commit-id>`:details in the given commit id.
`git diff`: show the difference between the pushed contents.
`git blame <filename>`: show the date, time, and author of changes made.
`git blame -L 5, 15 <filename>`: return details from line no. 5 to 15.
*The order in which the change information will display in each line as follows: < ID><Author><Date><Time><Line number><Content>  *

## Branches
`git checkout -B <branch>`: make a new branch and switch to it directly
`git branch <branch>`: make a new branch

*When you create a pull request you are asking the other developers to review your work and approve it to be merged with the repository.*.

*When you use Git Push, Git compares a snapshot of your local repository with the remote one and only replaces the files that have been changed.*

*Whenever a change occurs for a commit, the single hashed ID will update to be the latest commit for that working directory.*

  