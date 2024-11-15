#!/bin/bash

STEP_FILE=$1  # Get the step.txt file as the first argument
README_FILE="README.md"

if [ -z "$STEP_FILE" ]; then
    echo "Error: No step.txt file provided!" 
    exit 1
fi

if [ -f "$STEP_FILE" ]; then
    # Generate a unique marker based on the step file name
    MARKER="<!-- $(basename "$STEP_FILE") -->"

    # Check if the marker exists in the README file
    if grep -q "$MARKER" "$README_FILE"; then
        echo "Content from $STEP_FILE already exists in $README_FILE. Skipping append."
    else
        # Append content with a unique marker to the README file
        {
            echo "$MARKER"
            cat "$STEP_FILE"
            echo "$MARKER"
        } >> "$README_FILE"
        echo "Content from $STEP_FILE appended to $README_FILE with marker."

        # Stage and commit the changes
        git add "$README_FILE"
        git commit -m "Update README with new step instructions"
        
        # Push changes back to the repository
        git push origin main
    fi
else
    echo "Error: $STEP_FILE not found!" 
    exit 1
fi
