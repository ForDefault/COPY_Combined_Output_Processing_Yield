# Combined_Output_Processing_Yield (COPY) Script

**Note: The alias creation is optional and not required to run the script.**


---

## Overview
The Combined_Output_Processing_Yield (COPY) script is designed to automate the process of consolidating all readable text documents within a directory into a single combined document. Additionally, it creates manageable chunks of the combined document to facilitate easy uploading to AI systems for further processing. **This script does not parse images.**

## Features

1. **Directory Scanning:** 
   The script scans through the specified directory, identifying all readable text files. It skips non-text files to ensure smooth processing.

2. **Combining Text Documents:**
   All identified text files are combined into a single document. The paths of these files are listed at the beginning of the combined document for reference.

3. **Chunking for AI Upload:**
   The combined document is then divided into chunks of approximately 7000 characters each. This chunking is specifically designed to facilitate easy uploading to AI systems that may have input size limitations.

4. **Output Directory:**
   The script creates a new directory based on the parent directory's name, where all the chunks of the combined document are stored.

## How It Works

1. **Script Execution:**
   Run the script inside the directory you wish to process. The script will automatically scan the directory for all readable text files.

2. **Combining Process:**
   The script reads each text file and combines their contents into a single document. The paths of all included files are recorded at the beginning of this combined document.

3. **Chunking Process:**
   The combined document is split into chunks of approximately 7000 characters. Each chunk is saved as a separate file in the newly created output directory.

4. **Cleanup:**
   Any temporary files or directories created during the process are cleaned up to ensure no residual data is left behind.

## Optional Alias Creation

The script offers an optional feature to create an alias for easy future execution. If you choose to create an alias, follow these steps:

1. **Alias Creation Prompt:**
   The script will prompt you to enter a name for the alias.

2. **Alias Script Generation:**
   An alias script will be generated and placed in the same directory as the main script. This alias will allow you to run the script with a simple command.

3. **Alias Configuration:**
   The alias will be added to your shell configuration file (e.g., `.bashrc`), making it available for future use.

## Example Usage

1. **Run the Script:**
   ```bash
   ./combined_copy.sh
Provide Alias (Optional):

bash

Enter alias name: copy_script

>When run inside Chat-Gpt-firefox-Main
***Chat-Gpt-firefox-Main/***
```
├── BuildScript
├── config.json
├── content_scripts
│   ├── ChatGptInputContScript.js
│   └── ChatGptInputMethods.js
├── documentation
│   └── PopupScript.md
├── icons
│   ├── boing.png
│   ├── standard256.png
│   ├── standard32.png
│   ├── standard48.png
│   ├── standard64.png
│   ├── standard.png
│   ├── Jka128.png
│   ├── Jka256.png
│   ├── Jka32.png
│   ├── Jka48.png
│   ├── Jka64.png
│   ├── J16.png
│   ├── J256.png
│   ├── J32.png
│   ├── J48.png
│   ├── J64.png
│   └── J.png
├── LICENSE
├── manifest.json
├── package.json
├── package-lock.json
├── popup
│   ├── ChatGptInput.css
│   ├── ChatGptInput.html
│   └── ChatGptInput.js
├── README.md
├── screencaps
│   ├── chromeMainPage.png
│   ├── chromeSettingsPage.png
│   ├── mainPage.png
│   └── settingsPage.png
└── webpack.config.js
```
> A "combined_$FolderTitle" is generated as shown:

***combined_Chat-Gpt-firefox-Main***
```
├── combined.txt
├── document_chunked10.txt
├── document_chunked11.txt
├── document_chunked12.txt
├── document_chunked13.txt
├── document_chunked14.txt
├── document_chunked15.txt
├── document_chunked16.txt
├── document_chunked17.txt
├── document_chunked1.txt
├── document_chunked2.txt
├── document_chunked3.txt
├── document_chunked4.txt
├── document_chunked5.txt
├── document_chunked6.txt
├── document_chunked7.txt
├── document_chunked8.txt
└── document_chunked9.txt
```
> The combined.txt contains any/all documents which can be read from texts (no pictures). 
- File paths are marked clearly at the top; showing all the documents the "combined" file contains
- "===============" divides filepaths from the start of the document
> FilePaths exist, as comments, before each document begins (helpful to know which document is which)
- Example below:
```
"#/home/$USER/Downloads/Chat-Gpt-firefox-Main/BuildScript"  is above the start of the first document
```
```
/home/$USER/Downloads/Chat-Gpt-firefox-Main/BuildScript
/home/$USER/Downloads/Chat-Gpt-firefox-Main/webpack.js
/home/$USER/Downloads/Chat-Gpt-firefox-Main/package-lock.json
/home/$USER/Downloads/Chat-Gpt-firefox-Main/.gitignore
/home/$USER/Downloads/Chat-Gpt-firefox-Main/manifest.json
/home/$USER/Downloads/Chat-Gpt-firefox-Main/README.md
/home/$USER/Downloads/Chat-Gpt-firefox-Main/.gitattributes
/home/$USER/Downloads/Chat-Gpt-firefox-Main/LICENSE
/home/$USER/Downloads/Chat-Gpt-firefox-Main/config.json
/home/$USER/Downloads/Chat-Gpt-firefox-Main/package.json
/home/$USER/Downloads/Chat-Gpt-firefox-Main/popup/ChatGpt.js
/home/$USER/Downloads/Chat-Gpt-firefox-Main/popup/ChatGpt.html
/home/$USER/Downloads/Chat-Gpt-firefox-Main/popup/ChatGpt.css
/home/$USER/Downloads/Chat-Gpt-firefox-Main/content_scripts/ChatGptMethods.js
/home/$USER/Downloads/Chat-Gpt-firefox-Main/content_scripts/ChatGptContScript.js
/home/$USER/Downloads/Chat-Gpt-firefox-Main/documentation/PopupContent.md
===============

#/home/$USER/Downloads/Chat-Gpt-firefox-Main/BuildScript
npm install
npJ webpack
#/home/$USER/Downloads/Chat-Gpt-firefox-Main/webpack.config.js
// webpack.config.js
const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');

module.eJports = {
    mode: 'production',
    entry: {
        popup: './popup/ChatGpt.js',
        Content: './content_scripts/ChatGptContent.js',
        Methods: './content_scripts/ChatGptMethods.js',
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader'],

####~~text continues for quite a while~~####
``` 

...One document to rule them all... 
