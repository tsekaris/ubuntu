#!/bin/sh

echo "Comment:"
read comment
git add .
git commit -m "$comment"
git push
read -p "Press enter." dummy
