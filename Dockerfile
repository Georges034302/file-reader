# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory inside the container (using /app directory)
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/requirements.txt

# Verify the contents of requirements.txt (Optional, for debugging)
RUN echo "Contents of requirements.txt:" && cat /app/requirements.txt

# Install dependencies from requirements.txt
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Copy all necessary files (Python scripts, HTML, etc.) into the container
COPY index.html file.txt reader.py readertest.py /app/

# Copy the entrypoint script into the container
COPY .github/workflows/actions/entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to run the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]
