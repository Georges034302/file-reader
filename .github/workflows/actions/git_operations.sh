#!/bin/bash

# Set up Git configuration
setup_git() {
  git config user.name "github-actions[bot]"
  git config user.email "github-actions[bot]@users.noreply.github.com"
}

# Update README.md using the provided step file
update_readme() {
  local step_file=$1

  if [ ! -f "$step_file" ]; then
    echo "Step file $step_file does not exist. Exiting..."
    exit 0
  fi

  bash .github/workflows/actions/update_readme.sh "$step_file"
}

# Commit and push changes to README.md
commit_and_push_readme() {
  git add README.md
  git commit -m "Update README.md" || echo "No changes to commit"
  git push origin main || echo "No changes to push"
}

# Commit any unstaged changes (if any) before pulling from remote
commit_unstaged_changes() {
  git add . || echo "No changes to add"
  git commit -m "Temporary commit before pulling changes" || echo "No changes to commit"
}

# Pull the latest changes from the remote main branch before pushing
pull_latest_changes() {
  git pull origin main --rebase
}

# Commit changes to index.html if word count was added
commit_and_push_index_html() {
  git add index.html
  git commit -m "Append word count to index.html" || echo "No changes to commit"
  git push origin main || echo "No changes to push"
}
