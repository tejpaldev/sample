# CI/CD Workflow for HealthApi

This repository contains a CI/CD workflow for the HealthApi application, configured for deployment to Oracle Cloud Infrastructure (OCI) on ARM64 architecture.

## Workflow Overview

### CI Pipeline (Continuous Integration)

The CI pipeline is triggered on:
- Push to the `main` branch
- Pull requests to the `main` branch

It performs the following steps:
1. Builds the .NET application
2. Runs tests
3. Builds a multi-architecture Docker image (including ARM64 support)
4. Pushes the Docker image to GitHub Container Registry (if on main branch)

### CD Pipeline (Continuous Deployment)

The CD pipeline is triggered:
- Automatically after a successful CI pipeline run on the `main` branch
- Manually via workflow dispatch

It performs the following steps:
1. Authenticates with OCI
2. Deploys the application to OCI Container Instances on ARM64 architecture
3. Verifies the deployment

## Required Secrets

To use these workflows, you need to set up the following secrets in your GitHub repository:

### For CI Pipeline
- `GITHUB_TOKEN` (automatically provided by GitHub)

### For CD Pipeline
- `OCI_CONFIG` - OCI CLI config file content
- `OCI_PRIVATE_KEY` - OCI API private key
- `OCI_COMPARTMENT_ID` - OCI compartment ID
- `OCI_AVAILABILITY_DOMAIN` - OCI availability domain
- `OCI_SUBNET_ID` - OCI subnet ID
- `OCI_REPOSITORY_ID` - OCI container repository ID

## Setting Up OCI CLI Configuration

1. Install OCI CLI locally
2. Run `oci setup config` to create a configuration file
3. Copy the content of the config file to the `OCI_CONFIG` secret
4. Copy the content of the private key file to the `OCI_PRIVATE_KEY` secret

## ARM64 Compatibility

The Dockerfile has been updated to support ARM64 architecture by using the `--platform=$BUILDPLATFORM` flag. This ensures that the Docker image can be built and run on ARM64 platforms like OCI's ARM-based instances.

## Manual Deployment

You can manually trigger the CD workflow from the GitHub Actions tab by selecting the "CD Pipeline - OCI ARM64 Deployment" workflow and clicking "Run workflow".

## Health Checks

The application includes health check endpoints:
- `/api/health` - Custom health endpoint
- `/health` - ASP.NET Core health checks middleware endpoint

These endpoints are used by the CD workflow to verify the deployment.
