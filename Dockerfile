# Use an official Python runtime as the base image
FROM python:3.8

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Flask and its dependencies
RUN pip install --no-cache-dir Flask

# Specify the command to run the application when the container starts
CMD ["flask", "run", "--host=0.0.0.0"]
