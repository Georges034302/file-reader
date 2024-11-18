# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Set the working directory inside the container (using root directory for this case)
WORKDIR /app  # We will use /app inside the container as the app directory

# Copy the requirements.txt file into the container (assuming it is in the root directory)
COPY requirements.txt /app/requirements.txt

# Install dependencies from requirements.txt
# RUN pip3 install -r /app/requirements.txt

# Copy all necessary files (Python scripts, HTML, etc.) into the container
COPY index.html file.txt reader.py /app/

# Copy the entrypoint script into the container
COPY .github/workflows/actions/entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to run the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]
