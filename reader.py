# reader.py
def update_index_with_word_count():
    # Read file.txt and count words
    try:
        with open("file.txt", "r") as file:
            text = file.read()
            word_count = len(text.split())
    except FileNotFoundError:
        print("file.txt not found.")
        return
    
    # Read index.html and replace the placeholder with word count
    try:
        print("Updated index.html content:")
        with open("index.html", "r") as file:
            html_content = file.read()
        
        updated_content = html_content.replace("<!--WORD_COUNT-->", str(word_count))
        
        # Write the updated content back to index.html
        with open("index.html", "w") as file:
            file.write(updated_content)
        
        print("index.html updated with word count:", word_count)
    
    except FileNotFoundError:
        print("index.html not found.")
    
if __name__ == "__main__":
    update_index_with_word_count()
