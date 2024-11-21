#!/bin/bash
for filename in static/*.png; do
    cwebp -o "static/$(basename "$filename" .png).webp" -lossless "$filename"
    rm "./$filename"
done
