FROM hashicorp/terraform:1.6

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Ensure Terraform binary is available and install tools
RUN apk add --no-cache bash git openssh && \
    ln -s /bin/terraform /usr/local/bin/terraform && \
    terraform --version

# Default command (optional)
ENTRYPOINT ["terraform"]
