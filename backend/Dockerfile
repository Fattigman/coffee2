FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache unzip ca-certificates curl

# Set PocketBase version
ARG PB_VERSION=0.23.0

# Download and unzip the correct Linux binary
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pb.zip -d /pb \
    && rm pb.zip

# Set working directory and expose port
WORKDIR /pb
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
