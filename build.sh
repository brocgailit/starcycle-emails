#!/bin/bash


    # mjml ./src/$d/index.mjml -o ./dist/$d.html --config.minify


shopt -s dotglob
echo "Updating README"
cat README.base.md > README.md
printf "\n\n%s\n" "## View Compiled MJML" >> README.md
find src/* -prune -type d | while IFS= read -r d; do 
    echo "Building $d"
    mjml ./$d/index.mjml -o ./dist/${d:4}.html --config.minify
    printf "%s\n" "- [${d:4}](../blob/master/dist/${d:4})" >> README.md
done
echo "Done!"