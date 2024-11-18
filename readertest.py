import pytest
from unittest.mock import patch, mock_open
import reader  # import reader.py and test the reader function

# Test: test_word_count_valid_file
def test_word_count_valid_file():
    with patch("builtins.open", new_callable=mock_open, read_data="Hello world! Welcome to file testing."):
        result = reader.count_words_in_file()
        print(f"Test: test_word_count_valid_file")
        print(f"Output: {result} (Expected: 6)\n")
        assert result == 6  # 6 words in the sample text

# Test: test_file_not_found
def test_file_not_found():
    with patch("builtins.open", side_effect=FileNotFoundError):
        result = reader.count_words_in_file()
        print(f"Test: test_file_not_found")
        print(f"Output: {result} (Expected: None)\n")
        assert result is None  # Function should return None for missing file

# Test: test_empty_file
def test_empty_file():
    with patch("builtins.open", new_callable=mock_open, read_data=""):
        result = reader.count_words_in_file()
        print(f"Test: test_empty_file")
        print(f"Output: {result} (Expected: 0)\n")
        assert result == 0  # 0 words in an empty file

# Test: test_single_word
def test_single_word():
    with patch("builtins.open", new_callable=mock_open, read_data="OneWord"):
        result = reader.count_words_in_file()
        print(f"Test: test_single_word")
        print(f"Output: {result} (Expected: 1)\n")
        assert result == 1  # Single word should return count of 1
