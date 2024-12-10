# Use an official TeX Live image as the base
FROM texlive/texlive:latest

# Set the working directory
WORKDIR /workspace

# Install additional tools and latexextra using tlmgr
RUN apt-get update && apt-get install -y \
    git \
    curl \
    latexmk \
    && apt-get clean && rm -rf /var/lib/apt/lists/* 

# Default entrypoint and command for building LaTeX documents
ENTRYPOINT ["sh", "-c"]

# Default command to compile the main LaTeX file
CMD ["latexmk", "-pdf" "wp.tex"]
