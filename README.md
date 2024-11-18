# file-reader
[<img src="https://github.com/user-attachments/assets/5edd93c3-b713-4964-99b4-d203b654c42d" width="80" height="80">](https://georges034302.github.io/file-reader/)

Reading text file content and display word count on HTML using Python script running on a Docker image. Run pytest script on Docker to test the Python file reader script.
The project is a GitHub workflow pipeline, where each step triggers the next. 
Clone the repository to start initialization phase.## Step 1 Complete :white_check_mark:
Great! You uploaded index.html
### Next Step: Python Word Count Script
- Update the workflow step 02 `02_upload_word_count_script.yml`
- Add trigger on-push `reader.py`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/02_step.txt`
- Develop and add the Python script `reader.py`
