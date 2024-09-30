# Use Python 3.6 as the base image
FROM python:3.6

# Expose port 5002 for the Flask app
EXPOSE 5002

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Run the Flask application
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5002"]
