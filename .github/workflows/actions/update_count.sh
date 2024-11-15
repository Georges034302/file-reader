#!/bin/bash

# Calculate word count of file.txt
WORD_COUNT=$(wc -w < file.txt)

# Read current content of index.html
HTML_CONTENT=$(cat index.html)

# Update the word count in the HTML
UPDATED_CONTENT="<p>The word count of file is: $WORD_COUNT</p>"

# Replace the existing word count line or append if not found
if grep -q 'The word count of file is:' index.html; then
  sed -i "s|<p>The word count of file is: .*</p>|$UPDATED_CONTENT|" index.html
else
  echo "$UPDATED_CONTENT" >> index.html
fi

# Staging and committing changes
git add index.html
git commit -m "Update word count in index.html"
git push origin main
