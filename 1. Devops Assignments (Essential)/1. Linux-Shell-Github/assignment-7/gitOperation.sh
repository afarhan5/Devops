# Create folder and file
mkdir ninja
echo "Trying fast forward merge" > ninja/README.md

# Create and switch to ninja branch
git checkout -b ninja
git status

# Add and commit
git add ninja/README.md
git commit -m "Added README.md to ninja"

# Switch to master and fast-forward merge
git checkout master
git merge ninja

# Modify README in master and commit
echo "Changes in master branch" > ninja/README.md
git add ninja/README.md
git commit -m "Modified README in master"

# Switch to ninja and modify README
git checkout ninja
echo "Changes in ninja branch" > ninja/README.md
git commit -am "Modified README in ninja"

# Switch to master and merge to trigger conflict
git checkout master
git merge ninja

# Conflict Resolution using theirs (prefer ninja’s version)
git checkout --theirs ninja/README.md
git add ninja/README.md
git commit -m "Resolved conflict using ninja branch version (theirs)"

# Conflict Resolution using ours (prefer master’s version)
git checkout --ours ninja/README.md
git add ninja/README.md
git commit -m "Resolved conflict using master branch version (ours)"
