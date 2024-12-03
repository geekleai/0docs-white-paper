# Use an official TeX Live image as the base
FROM texlive/texlive:latest

# Set the working directory in the container
WORKDIR /workspace

# Copy the LaTeX project files into the container
COPY . /workspace

# Install additional tools needed for GitHub Actions scripts
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Entrypoint for building the LaTeX document
ENTRYPOINT ["pdflatex"]

# Default command to compile the main LaTeX file
CMD ["-interaction=nonstopmode", "wp.tex"]