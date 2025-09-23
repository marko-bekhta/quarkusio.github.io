#!/bin/bash

# A simple script to demonstrate adding an element to a YAML array using yq.

# Define the variables to be used in the yq command
nextsessiontitle="EPISODE #219: 456"
date="October 1, 2025"
nextsessionguest="new authors"
video_link="https://newlink"

# Step 1: Create a starting YAML file
cat << EOF > videos.yml
pastvideos:
  - title: "EPISODE #218: 123"
    link: https://somelink
    date: "September 15, 2025"
    authors: "authors bla bla bla"
EOF

echo "Initial YAML file (videos.yml):"
cat videos.yml
echo "---"

# Step 2: Use yq -i to prepend the new element in-place using shell variables.
# This approach concatenates the new element (as an array) with the existing array.
yq -i '
.pastvideos = [
  {
    "title": "'"$nextsessiontitle"'",
    "date": "'"$date"'",
    "authors": "'"$nextsessionguest"'",
    "link": "'"$video_link"'"
  }
] + .pastvideos
' videos.yml

echo "Updated YAML file (videos.yml) after in-place modification:"
cat videos.yml
