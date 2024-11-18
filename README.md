# file-reader
[<img src="https://github.com/user-attachments/assets/5edd93c3-b713-4964-99b4-d203b654c42d" width="80" height="80">](https://georges034302.github.io/file-reader/)

Reading text file content and display word count on HTML using Python script running on a Docker image. Run pytest script on Docker to test the Python file reader script.
The project is a GitHub workflow pipeline, where each step triggers the next. 
Clone the repository to start initialization phase.

## Initial Step: Cloning Repository :white_check_mark:
Great! You cloned the repository `file-reader`
### Next Step: Upload index.html
- Update the workflow step 01 `01_upload_index.yml`
- Add trigger on-push `index.html`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/01_step.txt`
- Upload `index.html`
## Step 1 Complete :white_check_mark:
Great! You uploaded index.html
### Next Step: Python Word Count Script
- Update the workflow step 02 `02_upload_word_count_script.yml`
- Add trigger on-push `reader.py`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/02_step.txt`
- Develop and add the Python script `reader.py`
## Step 2 Complete :white_check_mark:
Well done! You added reader.py.
### Next Step: Dockerfile
Create a Dockerfile that installs Python, reads file.txt, and updates index.html with the word count.
### Next Step: Dockerfile
- Update the workflow step 03 `03_upload_dockerfile.yml`
- Add trigger on-push `Dockerfile`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/03_step.txt`
- Develop and add `Dockerfile`
## Step 3 Complete :white_check_mark:
Nice work! You uploaded Dockerfile.
### Next Step: File Detector
- Update the workflow step 04 `04_detect_file.yml`
- Add trigger on-push `file.txt`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/04_step.txt`
- Add new command to update index.html using `.github/workflows/actions/update_count.sh`
