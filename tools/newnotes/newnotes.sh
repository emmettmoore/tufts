#!/bin/sh
#
# newnotes - quickly creates a new markdown file intended to be used to take notes
#          - copies a style.css file into the working directory
#          - allows the user to specify a title
#  

NOTES="notes.mdown"
STYLE="style.css"
SOURCEPATH="/Users/emmett/ewmoore823/tufts/tools/newnotes/"
     if test -e "$STYLE"
     then
         STYLE="good-one-bro.css"
         echo
         echo "style.css already exists!" 
         echo "style file named good-one-bro.css to avoid collisions"
         echo "style sheet cannot be used until collision resolved manually\n"
     fi
     echo "Name of Notes File? (no spaces or extensions)"
     read TITLE
     MDFILE="$TITLE.md"
     HTMLFILE="$TITLE.html"
     
     cp "$SOURCEPATH$STYLE"  "./$STYLE"
     cp "$SOURCEPATH$NOTES"  "./$MDFILE"
     markdown "$MDFILE" > "$HTMLFILE"
     open "$HTMLFILE"
     exit 1
