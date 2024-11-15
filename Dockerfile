# Dockerfile installs latest ubuntu
FROM ubuntu:latest

# Install Python
RUN apt-get update && apt-get install -y python3

# Set the working directory
WORKDIR /app

# Copy necessary files into the container
COPY index.html file.txt reader.py ./

# Run the Python script
CMD ["python3", "reader.py"]
