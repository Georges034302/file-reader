#!/bin/bash

# Run the reader.py script to process file.txt and get the word count
WORD_COUNT=$(python3 reader.py)

# Ensure that the word count is a valid number (only digits)
if [[ "$WORD_COUNT" =~ ^[0-9]+$ ]]; then
  echo "Current word count: $WORD_COUNT"
else
  echo "Error: Word count is invalid. Exiting."
  exit 1
fi

# Replace the old word count in the <p> tag
sed -i "s|<p>The word count of file.txt is: [0-9]* words</p>|<p>The word count of file.txt is: $WORD_COUNT words</p>|g" index.html

# Load content from the txt file and append to README.md
cat ./github/workflows/steps/04_step.txt >> README.md
# Stage and commit the updated README.md file
git add README.md
git commit -m "Update README with Step 4 instructions"
git push origin main
