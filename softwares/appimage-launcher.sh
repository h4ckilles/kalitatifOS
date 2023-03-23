#!/bin/sh

# Replace REPO_OWNER and REPO_NAME with the owner and name of the repository
url="https://api.github.com/repos/TheAssassin/AppImageLauncher/releases/latest"

# Make a GET request to the GitHub API and collect the download url
download_url=$(curl "$url" | jq -r '.assets[] | select( .name | contains("amd64.deb") and contains("bionic")).browser_download_url')

file_name=$(echo $download_url | rev | cut -d '/' -f 1 | rev)

if [ -n "$download_url" ]; then
	# Download the file using curl
	wget "$download_url"
else
	# There was no asset that matched the regex
	echo "No assets matching the json query expression"
	exit 1
fi

# Do the actual install
sudo apt install ./$file_name
rm $file_name
