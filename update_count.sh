#!/bin/bash

# Run the reader.py script to process file.txt and get the word count
WORD_COUNT=$(python3 reader.py)

# Debugging: Print what the word count is returning
echo "Word count returned: $WORD_COUNT"

# Ensure that the word count is a valid number (only digits)
if [[ "$WORD_COUNT" =~ ^[0-9]+$ ]]; then
  echo "Current word count: $WORD_COUNT"
else
  echo "Error: Word count is invalid. Exiting."
  exit 1
fi

# Display current content of index.html before the update
echo "Current index.html content:"
cat index.html

# Use printf to safely format the word count and ensure correct escaping
echo "Updating index.html with new word count: $WORD_COUNT"
# Replace the old word count in the <p> tag
sed -i "s|<p>The word count of file.txt is: [0-9]* words</p>|<p>The word count of file.txt is: $WORD_COUNT words</p>|g" index.html

# Display updated content
echo "Updated index.html content:"
cat index.html

# Update README with the step completion information
echo "## Step 4 Complete" >> README.md
echo "Nice work! You uploaded Dockerfile." >> README.md
echo "### Final Step: File Detector" >> README.md
echo "Deploy the application by configuring the desired deployment setup." >> README.md

# Stage and commit the updated index.html
git add index.html
git commit -m "Update index.html with new word count"
git push origin main
