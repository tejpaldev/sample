# Health API

A simple .NET Core API with a health endpoint.

## Running the Application Locally

```bash
dotnet run
```

The API will be available at:
- http://localhost:5010/api/health

## Running with Docker

### Prerequisites
- Docker Desktop installed and running

### Build and Run with Docker

#### Using Docker CLI

Build the Docker image:
```bash
docker build -t healthapi .
```

Run the container:
```bash
docker run -d -p 8080:80 --name healthapi-container healthapi
```

The API will be available at:
- http://localhost:8080/api/health

Stop and remove the container:
```bash
docker stop healthapi-container
docker rm healthapi-container
```

#### Using Docker Compose

```bash
docker-compose up -d
```

The API will be available at:
- http://localhost:8080/api/health

Stop and remove the container:
```bash
docker-compose down
```

#### Using Convenience Scripts

For Windows Command Prompt:
```bash
docker-build-run.bat
```

For PowerShell:
```bash
.\docker-build-run.ps1
```

## API Endpoints

### Health Check
```
GET /api/health
```

Response:
```json
{
  "status": "Healthy",
  "timestamp": "2025-05-14T17:30:00Z"
}
```
