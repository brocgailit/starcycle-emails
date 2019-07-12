#!/bin/bash


    # mjml ./src/$d/index.mjml -o ./dist/$d.html --config.minify


shopt -s dotglob
find src/* -prune -type d | while IFS= read -r d; do 
    echo "Building $d"
    mjml ./$d/index.mjml -o ./dist/${d:4}.html --config.minify
done
echo "Done!"