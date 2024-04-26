# Use a lightweight Linux distribution as base image
FROM alpine:latest

# Install required packages
RUN apk --no-cache add bash yq

# Copy the Shell script into the container
COPY yaml_parser.sh /usr/local/bin/yaml_parser.sh


# Make the main script executable
RUN chmod +x /usr/local/bin/yaml_parser.sh

# Define the entry point for the container
ENTRYPOINT ["/usr/local/bin/yaml_parser.sh"]

