# Use official Python 3.10 slim image (lightweight)
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first and install dependencies (cache optimization)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your backend code
COPY . .

# Expose port 5000 to be accessible outside container
EXPOSE 5000

# Run Flask app on 0.0.0.0 so Docker can route traffic in
CMD ["python", "app.py"]
