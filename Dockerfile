# Use official Python image
FROM registry.redhat.io/ubi9/python-311

# Set working directory
WORKDIR /app

# Copy requirements if exists, else skip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source code
COPY . .

# Expose Flask default port
EXPOSE 5000

# Set environment variables for Flask
ENV FLASK_APP=server.py \
    FLASK_RUN_HOST=0.0.0.0 \
    PYTHONUNBUFFERED=1

# Run Flask server
CMD ["flask", "run"]