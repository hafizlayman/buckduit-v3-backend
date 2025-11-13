# Use official Python runtime
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port (Railway uses 8000)
EXPOSE 8000

# Start backend
CMD ["python", "app.py"]
