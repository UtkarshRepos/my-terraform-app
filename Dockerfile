FROM hashicorp/terraform:1.6

WORKDIR /app
COPY . .

RUN apk add --no-cache bash git openssh

CMD ["terraform", "--version"]
