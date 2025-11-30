# Uangku Infrastructure - FrankenPHP Base Image

A precompiled Docker base image built on top of [FrankenPHP](https://frankenphp.dev/) with commonly used PHP extensions and Composer pre-installed.

## Features

- Based on `dunglas/frankenphp` - a modern PHP application server
- Pre-installed PHP extensions:
  - `pcntl` - Process control support
  - `pdo_mysql` - MySQL database support via PDO
  - `intl` - Internationalization functions
- Composer pre-installed for dependency management

## Image

The image is available on GitHub Container Registry:

```
ghcr.io/oratakashi/uangku-infra-frankenphp:latest
```

## Usage

### Pull the Image

```bash
docker pull ghcr.io/oratakashi/uangku-infra-frankenphp:latest
```

### Use as Base Image

Create your own `Dockerfile` using this as the base:

```dockerfile
FROM ghcr.io/oratakashi/uangku-infra-frankenphp:latest

# Copy your application
COPY . /app

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Your additional configuration...
```

### Run a Container

```bash
docker run -p 8080:80 -v $(pwd):/app ghcr.io/oratakashi/uangku-infra-frankenphp:latest
```

## Included Tools

| Tool | Description |
|------|-------------|
| FrankenPHP | Modern PHP application server based on Caddy |
| Composer | PHP dependency manager |

## PHP Extensions

| Extension | Description |
|-----------|-------------|
| pcntl | Process Control - allows PHP to create child processes |
| pdo_mysql | PDO driver for MySQL databases |
| intl | Internationalization extension for locale-aware operations |

## Building Locally

To build the image locally:

```bash
docker build -t uangku-infra-frankenphp .
```

## GitHub Actions

This repository includes a GitHub Actions workflow that automatically builds and pushes the Docker image to GitHub Container Registry on every push to the `main` branch.

### Required Secrets

- `GHCRIO` - GitHub Personal Access Token with `write:packages` permission

## License

MIT License - see [LICENSE](LICENSE) for details