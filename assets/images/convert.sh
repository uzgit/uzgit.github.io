#!/usr/bin/bash

for image_file in *.{png,PNG,jpg,JPG}
do
	output_filename=${image_file::-4}.webp
	echo $output_filename
	cwebp $image_file -o $output_filename
done
