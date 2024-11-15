#!/bin/bash

# Check if the step.txt file argument is provided
STEP_FILE=$1  # Get the step.txt file as the first argument

# Ensure that the STEP_FILE variable is not empty
if [ -z "$STEP_FILE" ]; then
    echo "Error: No step.txt file provided!" 
    exit 1
fi

# Check if the provided step.txt file exists
if [ -f "$STEP_FILE" ]; then
    # Read the content of the step.txt file
    STEP_CONTENT=$(cat "$STEP_FILE")
    echo "Step content read successfully."

    # Check if the content from the step.txt file is already in README.md
    if grep -Fxq "$STEP_CONTENT" README.md; then
        echo "Content from $STEP_FILE already exists in README.md. Skipping append."
    else
        # Append content from the step.txt file to README.md
        echo "$STEP_CONTENT" >> README.md
        echo "Content from $STEP_FILE appended to README.md."
    fi
else
    # If the step.txt file is not found, add an error message to the README
    echo "Error: $STEP_FILE not found!" >> README.md
    echo "$STEP_FILE not found!"
fi

# Ensure git user information is set for commit
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Stage and commit the changes to README.md if there are any changes
if git diff --quiet README.md; then
    echo "No changes to commit."
else
    git add README.md
    git commit -m "Update README with instructions from $STEP_FILE"
    git push origin main
    echo "Changes committed and pushed to the main branch."
fi
