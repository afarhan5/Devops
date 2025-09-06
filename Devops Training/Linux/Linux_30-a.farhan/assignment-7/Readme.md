# Assignment-7 :- Git


# PART-A: Branch Management

# Commands:

- ./gitBranches.sh -l: List all branches.

- ./gitBranches.sh -b <branch_name>: Create a new branch.

- ./gitBranches.sh -d <branch_name>: Delete a branch.

- ./gitBranches.sh -m -1 <branch_name1> -2 <branch_name2>: Merge branch_name1 into branch_name2.

- ./gitBranches.sh -r -1 <branch_name1> -2 <branch_name2>: Rebase branch_name1 onto branch_name2.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# PART B: Tag Management

# Commands:

- ./gitTags.sh -t <tag_name>: Create a new tag.

- ./gitTags.sh -l: List all tags.

- ./gitTags.sh -d <tag_name>: Delete a tag.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# PART C: Commit Report

# Command:

- ./gitCommitReport.sh -u <repo_url> -d <days>: Generate a commit report for the last <days> from the provided repository URL.

- Output includes commit ID, author, email, message, changed files, and optionally whether the commit is valid (starts with JIRA-XXXX:).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

# PART D: Git Operations

- Create a folder ninja and add a README.md file with "Trying fast forward merge" content.

- Create and commit changes in a ninja branch.

- Merge ninja branch into master with a new commit.

- Modify README.md in both master and ninja branches, commit changes.

- Generate a merge conflict when merging ninja into master and resolve using the "ours" and "theirs" merge strategies, making ninja changes override master changes.
  
