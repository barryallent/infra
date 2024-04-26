## YAML Parser

**Description**

This yaml parser, parses YAML files and directories for a specific key and value combination. It supports nested keys, list access, and finding all occurrences within a list.

**Usage:**

**Arguments:**

* `<yaml_path>`: Path to the YAML file or directory containing YAML files.
* `<key_path>`: The key to search for in the YAML files. You can use dot notation for nested keys and bracket notation for lists.
    * `[*]`: Matches all elements in a list.
    * `[<index>]`: Matches a specific element in a list (e.g., `[0]` for the first element).
* `<value>`: The value to match against the key. This does not support matching via regex.

**Output:**

The script prints three comma-separated columns:

* **First:** The matched key (if `port[*].name`, prints each port name on a separate line).
* **Second:** The matched value (if multiple ports match, prints value for each port on a separate line).
* **Third:** The relative path of the YAML file where the match was found.

## Steps to use the yaml parser


### Step 1: Install docker on local
* Ensure you have docker installed. You can install it using https://www.docker.com/products/docker-desktop/#
* After successful installation, start docker.

### Step 2: Build the image

```
docker build  -t yaml-parser .
```

### Step 3: Run the container 
Run the container mount the directory where all the yaml's exists and pass the required arguments for the script

```
docker run -v <absolute path of yaml directory/file on local machine>:/yaml yaml-parser /yaml/<yaml file/directory name on local> "key_path" "value"
```
Example
*   Note: Please pass arguments inside quotes, especially key_path.
```
docker run -v /Users/abhinavtyagi/IdeaProjects/yamlParser/:/yaml/ yaml-parser /yaml/example_yamls "spec.ports[*].name" http
```

### Steps to use script directly
Below are the example usage of the yaml parser script

```
./yaml_parser.sh "yaml file/directory" "key_path" "value to match"
./yaml_parser.sh ../example_yamls/  "spec.ports[*].name" http
./yaml_parser.sh ../example_yamls/  "kind" Deployment
```