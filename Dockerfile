# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directoryy
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*
    
# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .
COPY uwsgi.ini .

# Expose port 5000
EXPOSE 5000 9191

# Run the application with uWSGI using ini file
CMD ["uwsgi", "--ini", "uwsgi.ini"]