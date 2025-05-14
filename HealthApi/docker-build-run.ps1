Write-Host "Building Docker image for HealthApi..." -ForegroundColor Green
docker build -t healthapi .

Write-Host "Starting Docker container..." -ForegroundColor Green
docker run -d -p 8080:80 --name healthapi-container healthapi

Write-Host "Docker container started. You can access the API at:" -ForegroundColor Green
Write-Host "http://localhost:8080/api/health" -ForegroundColor Cyan

Write-Host "To stop the container, run:" -ForegroundColor Yellow
Write-Host "docker stop healthapi-container" -ForegroundColor Cyan
Write-Host "docker rm healthapi-container" -ForegroundColor Cyan
