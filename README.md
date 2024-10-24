# Docker TeX and Python Tools

![Docker Pulls](https://img.shields.io/docker/pulls/infocornouaille/tools)
![Docker Build Status](https://img.shields.io/docker/build/infocornouaille/tools)
![Docker Image Size](https://img.shields.io/docker/image-size/infocornouaille/tools/base)
![GitHub License](https://img.shields.io/github/license/infocornouaille/docker-tools)

Custom Docker images built on top of `texlive/texlive` with additional Python tools for document processing and code formatting.

## Available Images

### Base Image (`infocornouaille/tools:base`)

A base image containing TeXLive with essential Python development tools:

- TeXLive (latest)
- Python 3 with pip
- Pandoc
- Poppler Utils
- ImageMagick
- Black (Python formatter)
- isort (Python import sorter)

### Custom Image (`infocornouaille/tools:perso`)

Extended image with additional document processing tools:

- All components from the base image
- latexcor
- pdfcor
- Custom Pandoc templates and filters
- Custom LaTeX configurations

## Usage

Pull the images from Docker Hub:

```bash
# Pull base image
docker pull infocornouaille/tools:base

# Pull custom image
docker pull infocornouaille/tools:perso
```

### Building the Images Locally

To build the images locally:

```bash
# Build base image
docker build -f Dockerfile.base -t infocornouaille/tools:base .

# Build custom image (with no cache to ensure latest packages)
docker build --no-cache -f Dockerfile.perso -t infocornouaille/tools:perso .
```

## Structure

### Base Image (`Dockerfile.base`)
```dockerfile
FROM texlive/texlive:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    pandoc \
    poppler-utils \
    imagemagick \
    python3-venv \
    pipx

# Configure pipx and add to PATH
ENV PATH="/root/.local/bin:$PATH"
RUN pipx ensurepath

# Install Python tools
RUN pipx install black && \
    pipx install isort
```

### Custom Image (`Dockerfile.perso`)
```dockerfile
FROM infocornouaille/tools:base

# Install document processing tools
RUN pipx install latexcor && \
    pipx install pdfcor

# Create directories for custom templates and filters
RUN mkdir -p /usr/share/pandoc/templates \
    /usr/share/pandoc/data/templates/ \
    /usr/local/share/pandoc/filters \
    /usr/local/share/texmf/tex/latex/local

# Copy custom files
COPY pandoc-filters /usr/local/share/pandoc/data/filters/
COPY pandoc-templates /usr/share/pandoc/data/templates/
COPY custom-latex /usr/local/texlive/texmf-local/tex/latex/local/
COPY custom-latex /usr/local/share/texmf/tex/latex/local/

# Update TeXLive database
RUN texhash

# Set working directory
WORKDIR /data
```

## Custom Configuration

The custom image includes several directories for personalization:

- `/usr/share/pandoc/templates`: Pandoc templates
- `/usr/local/share/pandoc/filters`: Pandoc filters
- `/usr/local/share/texmf/tex/latex/local`: Custom LaTeX files

## Updating

To update the Python packages (latexcor and pdfcor), rebuild the custom image with the `--no-cache` flag:

```bash
docker build --no-cache -f Dockerfile.perso -t infocornouaille/tools:perso .
```

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.