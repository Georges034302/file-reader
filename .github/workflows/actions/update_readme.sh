#!/bin/bash

# Check if the step.txt file exists
STEP_FILE=$1  # Get the step.txt file as the first argument

if [ -z "$STEP_FILE" ]; then
    echo "Error: No step.txt file provided!" 
    exit 1
fi

# Check if the provided file exists
if [ -f "$STEP_FILE" ]; then
    # Check if README.md already contains the exact content of the step file
    if grep -Fxq "$(cat "$STEP_FILE")" README.md; then
        echo "Content from $STEP_FILE already exists in README.md. Skipping append."
    else
        # Append content from the step.txt file to README.md
        cat "$STEP_FILE" >> README.md
        echo "Content from $STEP_FILE appended to README.md"

        # Stage and commit the changes to README.md
        git add README.md
        git commit -m "Update README with new step instructions"
        
        # Push changes back to the repository
        git push origin main
    fi
else
    echo "Error: $STEP_FILE not found!" 
    exit 1
fi