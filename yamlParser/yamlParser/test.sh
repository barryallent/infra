#!/bin/bash

# Define the variable key_path
key_path=".spec.ports[*].name"
yaml_file="../infra/kafka/kafka.yml"
value="client"
# Check if key_path contains [*]
    if [[ "$key_path" == *[*]* ]]; then
        # Replace [*] with []
        old_key_path=$key_path
        key_path="${key_path//\[\*\]/[]}"
        echo inside  $key_path
        result=$(yq "$key_path | select(. == \"$value\")" "$yaml_file")
        key_path=$old_key_path
    fi

    if [ ! -z "$result" ]; then
        echo "key = ${key_path}, value = $value, file = $yaml_file"
    fi

# Print the modified key_path
echo "Modified key_path: $key_path"
