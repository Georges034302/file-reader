# reads file.txt and count the words
def count_words_in_file():
    # Read file.txt and count words
    try:
        with open("file.txt", "r") as file:
            text = file.read()
            word_count = len(text.split())
            return word_count
    except FileNotFoundError:
        print("file.txt not found.")
        return None

if __name__ == "__main__":
    word_count = count_words_in_file()
    if word_count is not None:
        print(word_count)  # Only print the word count
    else:
        print("Error: Word count is invalid. Exiting.")
        exit(1)
