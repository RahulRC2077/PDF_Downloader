#Scripts by RC
#!/bin/bash

# Prompt for URL
read -p "Enter the URL: " link

# Validate URL
if [[ ! $link =~ ^https?:// ]]; then
  echo "Invalid URL. Please enter a valid URL starting with http:// or https://"
  exit 1
fi

# Create download directory if it doesn't exist
mkdir -p course_pdfs

# Download files with progress bar and error handling
wget -r -l1 -A.pdf -nd -np -e robots=off --progress=bar:force -P course_pdfs "$link" || {
  echo "Download failed. Check URL, internet connection, and permissions."
  exit 1
}

# Success message
echo "Downloaded all PDFs successfully!"
