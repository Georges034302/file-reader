# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Install Python and dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Set the working directory inside the container
WORKDIR /app

# Copy necessary files into the container
COPY index.html file.txt reader.py readertest.py ./

# Install Python dependencies (you can add requirements.txt if needed)
RUN pip3 install -r requirements.txt  # Optional, if you have requirements file

# Install pytest
RUN pip3 install pytest

# Run pytest with verbose output and short traceback
CMD ["pytest", "-v", "--tb=short", "readertest.py"]
