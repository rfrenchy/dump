#!/bin/bash
# dependencies: imagemagick - sudo apt install imagemagick
# usage: ./insta-resize.sh image-name.png

square() {
    # Get original height and width
    wx=$(identify "$1" | awk '{print $3}' | cut -f 1 -d x) 
    hx=$(identify "$1" | awk '{print $3}' | cut -f 2 -d x)

    # Find biggest dimension of the two, 
    # then use to make 1:1 dimension string
    dx=$((wx > hx ? wx : hx))                             
    dxx="${dx}x${dx}"                                     

    # Use the name of the image thats been input, minus the file extension 
    # e.g. my-picture.png becomes my-picture
    IMAGE_OUTPUT_NAME=${1%.*} 

    # Create a white image at the new calculated dimension and 
    # composite with the original image
    convert -size $dxx xc: white-composite.png
    composite "$1" white-composite.png "$IMAGE_OUTPUT_NAME"-comp.png

    # Scale composited image to instagram's square measurements
    convert "$IMAGE_OUTPUT_NAME"-comp.png -resize "1080x1080" "$IMAGE_OUTPUT_NAME"-insta-square.png

    # MISC split by word for each line. at each word index for each line, find max word length at index, and fill all the others with spaces to max word length for that index
}

portrait() {
    echo "portrait"
}

landscape() {
    echo "landscape"    
}

case "$1" in 
    square) square "$2" ;;
    portrait) portrait "$2" ;;
    landscape) landscape "$2" ;;
esac



