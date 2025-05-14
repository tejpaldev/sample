@echo off
echo Building Docker image for HealthApi...
docker build -t healthapi .

echo Starting Docker container...
docker run -d -p 8080:80 --name healthapi-container healthapi

echo Docker container started. You can access the API at:
echo http://localhost:8080/api/health

echo To stop the container, run:
echo docker stop healthapi-container
echo docker rm healthapi-container
