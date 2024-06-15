#!/bin/bash

# Function to check if a git repository needs a push or pull
check_git_status() {
  local repo_path=$1
  cd $repo_path

  # Fetch the latest changes from the remote repository
  git fetch

  # Check if there are any commits that need to be pushed
  local need_push=$(git log HEAD..origin/$(git rev-parse --abbrev-ref HEAD) --oneline)
  # Check if there are any commits that need to be pulled
  local need_pull=$(git log origin/$(git rev-parse --abbrev-ref HEAD)..HEAD --oneline)

  if [ ! -z "$need_push" ]; then
    echo "The repository at $repo_path has commits that need to be pushed."
  fi

  if [ ! -z "$need_pull" ]; then
    echo "The repository at $repo_path has commits that need to be pulled."
  fi
}

# Check ~/.dotfiles repository
if [ -d ~/.dotfiles ]; then
  check_git_status ~/.dotfiles
fi

# Check ~/.spacemacs repository
if [ -d ~/.spacemacs ]; then
  check_git_status ~/.spacemacs
fi

