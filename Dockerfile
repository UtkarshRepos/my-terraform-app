FROM hashicorp/terraform:1.6

WORKDIR /app
COPY . .

RUN apk add --no-cache bash git openssh && \
    ln -s /bin/terraform /usr/local/bin/terraform && \
    terraform --version
