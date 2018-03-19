#!/bin/bash


# lower case all file name
for file in *.*; do
  mv  "$file" "${file,,}"
done

for file in *.*; do
  # get filename
  filename=${file%.*};
  # get extension
  extension=${file##*.};
  
  # don't change name this file
  if [ $extension = "sh" ]; then
     continue;
  fi
  #remove all symbol
  filename=${filename//[[:punct:]]/};
  #remove all blank
  filename=${filename//[[:blank:]]/};
  #remove all digital
  filename=${filename//[[:digit:]]/};

  #echo "Original: $file  Filename: ${filename} ; extension: ${extension}";
  mv  "$file" "${filename}.${extension}"
done
