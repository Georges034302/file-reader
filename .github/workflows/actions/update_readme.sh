#!/bin/bash

# Check if the step.txt file exists
STEP_FILE=$1  # Get the step.txt file as the first argument

if [ -z "$STEP_FILE" ]; then
    echo "Error: No step.txt file provided!" 
    exit 1
fi

# Check if the provided file exists
if [ -f "$STEP_FILE" ]; then
    # Append content from the step.txt file to README.md
    cat "$STEP_FILE" >> README.md
    echo "Content from $STEP_FILE appended to README.md"
else
    echo "Error: $STEP_FILE not found!" >> README.md
    echo "$STEP_FILE not found!" 
fi

# Stage and commit the changes to README.md
git add README.md
git commit -m "Update README with instructions"

# Push changes back to the repository
git push origin main
