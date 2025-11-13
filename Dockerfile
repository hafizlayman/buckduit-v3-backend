# Use official lightweight Python image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Install system deps (if future packages need it)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Railway default port
EXPOSE 8000

# Start backend
CMD ["python", "app.py"]
