#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p /home/$USER/combined_copy

# Path to the Python script
PYTHON_SCRIPT_PATH="/home/$USER/combined_copy/copy_combined.py"

# Move the provided Python script to the desired location
cat << 'EOF' > $PYTHON_SCRIPT_PATH
import os
import shutil
from math import ceil

# Function to count tokens and characters in a file
def count_tokens_and_characters(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()
        tokens = len(text.split())
        characters = len(text)
    return tokens, characters

# Function to count special characters in a block
def count_special_characters(block):
    special_characters = 0
    for char in block:
        if char in special_characters_set:
            special_characters += 1
    return special_characters

# Function to delete characters from the beginning of the file
def delete_characters(file_path, num_characters):
    with open(file_path, 'r+', encoding='utf-8') as file:
        text = file.read()
        file.seek(0)
        file.write(text[num_characters:])
        file.truncate()

# Function to create a directory based on the parent directory's name
def create_directory_based_on_parent(input_directory):
    parent_directory_name = os.path.basename(os.path.normpath(input_directory))
    new_directory = os.path.join(input_directory, f"combined_{parent_directory_name}")
    os.makedirs(new_directory, exist_ok=True)
    return new_directory

# Function to copy chunks of characters to separate files
def copy_chunks_to_files(original_file_path, output_directory, chunk_size=7000):
    os.makedirs(output_directory, exist_ok=True)
    with open(original_file_path, 'r', encoding='utf-8') as file:
        text = file.read()
    num_chunks = ceil(len(text) / chunk_size)
    for i in range(num_chunks):
        start_index = i * chunk_size
        end_index = min((i + 1) * chunk_size, len(text))
        chunk = text[start_index:end_index]
        chunk_file_path = os.path.join(output_directory, f"document_chunked{i+1}.txt")
        with open(chunk_file_path, 'w', encoding='utf-8') as chunk_file:
            chunk_file.write(chunk)
    print(f"{num_chunks} chunks created successfully.")

# Create a temporary directory to hold the combined documents temporarily
temporary_directory = os.path.join(os.getcwd(), "temporary_delete_me")
os.makedirs(temporary_directory, exist_ok=True)

# Write the listing of paths
text_file_paths = []
for root, _, files in os.walk(os.getcwd()): # Walk through the current directory
    for file in files:
        file_path = os.path.join(root, file)
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                file_content = f.read()
                text_file_paths.append(file_path)
        except UnicodeDecodeError:
            print(f"Skipping non-text file: {file_path}")

# Create a new text document to store the full paths of the copied files
combined_file_name = "combined.txt"
combined_file_path = os.path.join(temporary_directory, combined_file_name)
with open(combined_file_path, "w") as combined:
    for path in text_file_paths:
        combined.write(path + "\n")
    combined.write("===============")
    combined.write("\n")
    for file_path in text_file_paths:
        combined.write(f"\n\n#=#=#=#=#{file_path}#=#=#=#=#\n\n")
        with open(file_path, "r", encoding="utf-8") as src_file:
            combined.write(src_file.read())
            combined.write("\n")

print("Combined document created successfully.")

# Define the output directory for the chunks based on the parent directory
output_directory = create_directory_based_on_parent(os.getcwd())
print("Output Directory:", output_directory)

# Move the combined document to the output directory
shutil.move(combined_file_path, output_directory)

# Copy chunks of approximately 7000 characters to separate files
copy_chunks_to_files(os.path.join(output_directory, combined_file_name), output_directory)

# Remove temporary_delete_me directory
shutil.rmtree(temporary_directory)
EOF

# Make the script executable
chmod +x $PYTHON_SCRIPT_PATH

# Prompt the user for alias name
read -p "Enter alias name: " alias_name

if [ -n "$alias_name" ]; then
    ALIAS_SCRIPT_PATH="/home/$USER/combined_copy/$alias_name.sh"
    # Create the alias script
    cat << EOF > $ALIAS_SCRIPT_PATH
#!/bin/bash
# Execute the combined Python script with passed arguments
python3 $PYTHON_SCRIPT_PATH "\$@"
EOF

    # Make the alias script executable
    chmod +x $ALIAS_SCRIPT_PATH

    # Add alias to .bashrc
    echo "alias $alias_name='$ALIAS_SCRIPT_PATH'" >> /home/$USER/.bashrc
    source /home/$USER/.bashrc

    echo "Alias '$alias_name' created. You can now use the alias to run the script."
else
    echo "No alias name provided. Script setup is complete without alias."
fi
