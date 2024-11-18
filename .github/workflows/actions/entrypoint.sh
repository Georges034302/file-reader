#!/bin/bash

# Run the Python script
echo "Running the Python script..."
python3 reader.py

# Run pytest with verbose output and short traceback
echo "Running tests with pytest..."
pytest -v --tb=short readertest.py
