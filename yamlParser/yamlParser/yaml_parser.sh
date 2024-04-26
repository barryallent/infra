#!/bin/bash
#Example usages
#1.  ./yaml_parser.sh ../example_yamls/  "spec.ports[*].name" http
#2.  ./yaml_parser.sh ../example_yamls/  "kind" Deployment

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <yaml_path> <key_path> <value>"
    exit 1
fi

# Extract arguments
yaml_path="$1"
key_path="$2"
value="$3"

# Function to process a YAML file
process_yaml() {
    local yaml_file="$1"
    local result

    # Check if the key path contains [*]
    if [[ "$key_path" == *[*]* ]]; then
        # Replace [*] with []
        key_path="${key_path//\[\*\]/[]}"
        result=$(yq ".$key_path | select(. == \"$value\")" "$yaml_file")

    # Check if the key path contains [n], where n is whole number
    elif [[ "$key_path" =~ \[[0-9]+\] ]]; then
        result=$(yq ".$key_path | select(. == \"$value\")" "$yaml_file")

    else
        # Use yq with select query for direct key
        result=$(yq eval "select(.${key_path} == \"$value\")" "$yaml_file")
    fi

    # Output result if not empty
    if [ ! -z "$result" ]; then
        echo "key = ${key_path}, value = $value, file = $yaml_file"
    fi
}

# Function to process all YAML files in a directory recursively
process_directory() {
    local directory="$1"
    local yaml_files=$(find "$directory" -type f -name "*.yaml" -o -name "*.yml")

    # Process each YAML file
    for yaml_file in $yaml_files; do
        process_yaml "$yaml_file"
    done
}

# Main script logic
if [ -f "$yaml_path" ]; then
    process_yaml "$yaml_path"
elif [ -d "$yaml_path" ]; then
    process_directory "$yaml_path"
else
    echo "Invalid YAML path: $yaml_path"
    exit 1
fi
