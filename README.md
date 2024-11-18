# file-reader
[<img src="https://github.com/user-attachments/assets/5edd93c3-b713-4964-99b4-d203b654c42d" width="80" height="80">](https://georges034302.github.io/file-reader/)

Reading text file content and display word count on HTML using Python script running on a Docker image. Run pytest script on Docker to test the Python file reader script.
The project is a GitHub workflow pipeline, where each step triggers the next. 
Clone the repository to start initialization phase.

<hr>
## Initial Step: Cloning Repository :white_check_mark:
Great! You cloned the repository `file-reader`
### Next Step: Upload index.html
- Update the workflow step 01 `01_upload_index.yml`
- Add trigger on-push `index.html`
- Add new command to update README using `.github/workflows/actions/update_readme.sh` with `.github/workflows/steps/01_step.txt`
- Upload `index.html`
