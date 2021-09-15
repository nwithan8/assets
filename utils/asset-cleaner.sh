#!/bin/bash

# Use this tool to clean a repo of its `assets` directory through its entire git history.
# This is important because even if a file is removed, it remains in git history and continues using up disk space.
# Assumes you have `git-filter-repo` installed already: `brew install git-filter-repo`
# NOTE: Repos must have no default branch protection rules, no outstanding PRs, and no un-merged branches
# Usage: ./utils/asset-cleaner.sh my-repo-name

USERNAME="nwithan8"
FRESH_GIT_REPOS_PATH="$HOME/git/playground/assets"
PATH_TO_CLEAN="assets/" # Ensure a trailing slash is present for directories

main() {
    cd "$FRESH_GIT_REPOS_PATH" || exit 1
    git clone https://github.com/"$USERNAME"/"$1".git
    cd "$1" || exit 1
    echo "Removing '$PATH_TO_CLEAN' directory for $(pwd)"
    git filter-repo --invert-paths --path "$PATH_TO_CLEAN"
    git remote add origin https://github.com/"$USERNAME"/"$1"
    git push origin --force --all
    cd || exit 1
    echo "Script complete, inspect the repo for removed assets."
}

main "$1"
