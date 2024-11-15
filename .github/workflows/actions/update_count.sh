#!/bin/bash

# Path to the input file (file.txt)
INPUT_FILE="file.txt"

# Word count logic (using wc -w)
WORD_COUNT=$(wc -w < "$INPUT_FILE")

# Path to index.html
INDEX_FILE="index.html"

# Check if index.html exists
if [ -f "$INDEX_FILE" ]; then
    # Ensure the word count is inserted in the right location (the <p> tag)
    sed -i "s|<p>The word count of file is: |<p>The word count of file is: $WORD_COUNT|" "$INDEX_FILE"
    echo "Word count updated in index.html"
else
    echo "Error: $INDEX_FILE not found."
fi
