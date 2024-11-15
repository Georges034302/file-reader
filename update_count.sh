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

# Update README with the step completion information
echo "## Step 4 Complete" >> README.md
echo "Nice work! You updated the word count in index.html." >> README.md
echo "### Final Step: File Detector" >> README.md
echo "Deploy the application by configuring the desired deployment setup." >> README.md

# Stage and commit the updated index.html
git add index.html
git commit -m "Update index.html with new word count"
git push origin main
