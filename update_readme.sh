#!/bin/bash

# File to update
README="README.md"

# Content to append
UPDATE_NOTE="\
---
*Last updated: $(date '+%Y-%m-%d %H:%M:%S')*  
Automated update to README.md file.
"

# Check if README exists
if [ ! -f "$README" ]; then
  echo "Error: $README not found!"
  exit 1
fi

# Append update note to README.md
echo -e "\n$UPDATE_NOTE" >> "$README"
echo "README.md updated successfully."

# Stage the README
git add "$README"

# Commit changes
commit_message="Automatic update of README.md on $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_message"

# Push to remote repository (main branch)
git push origin main

echo "Changes pushed to GitHub repository."

