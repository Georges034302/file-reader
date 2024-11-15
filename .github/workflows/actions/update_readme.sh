#!/bin/bash

# Check if the step.txt file exists
STEP_FILE=$1  # Get the step.txt file as the first argument

if [ -z "$STEP_FILE" ]; then
    echo "Error: No step.txt file provided!" 
    exit 1
fi

# Check if the provided file exists
if [ -f "$STEP_FILE" ]; then
    # Read the content of the step.txt file
    STEP_CONTENT=$(cat "$STEP_FILE")
    
    # Check if the content is already in README.md
    if grep -Fxq "$STEP_CONTENT" README.md; then
        echo "Content from $STEP_FILE already exists in README.md. Skipping append."
    else
        # Append content from the step.txt file to README.md
        echo "$STEP_CONTENT" >> README.md
        echo "Content from $STEP_FILE appended to README.md"
    fi
else
    echo "Error: $STEP_FILE not found!" >> README.md
    echo "$STEP_FILE not found!" 
fi

# Stage and commit the changes to README.md if there are changes
if git diff --quiet README.md; then
    echo "No changes to commit."
else
    git add README.md
    git commit -m "Update README with instructions"
    git push origin main
fi
