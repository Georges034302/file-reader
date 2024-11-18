# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Install Python, pip, and the python3-venv package for creating virtual environments
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# Set the working directory inside the container (using /app directory)
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/requirements.txt

# Create a virtual environment and install dependencies inside the virtual environment
RUN python3 -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Install pytest separately in the virtual environment
RUN /venv/bin/pip install pytest

# Copy all necessary files (Python scripts, HTML, etc.) into the container
COPY index.html file.txt reader.py readertest.py /app/

# Copy the entrypoint script into the container
COPY .github/workflows/actions/entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to run the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]
