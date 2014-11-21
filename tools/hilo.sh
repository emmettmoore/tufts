#!/bin/sh
#
# hilo  - number guessing game. the computer
#         picks a number, you guess.
#         Also keeps a list of guesses.
# 
# ORIGINALLY WRITTEN BY BRUCE MOLAY copied here as an example script

TOP=100
TRIES=0
MAX=7
NUM=`expr $$ % $TOP`    # use process ID
GUESSES=""

    echo "I am thinking of a number between 0 and `expr $TOP - 1`"
    echo "You have $MAX guesses."
    while test $TRIES -lt $MAX
    do
        if test "$GUESSES" != "" 
        then
            echo "You have, so far, guessed: $GUESSES"
        fi
        TRIES=`expr $TRIES + 1`
        printf "Guess number $TRIES? "
        read G
        if test $G -eq $NUM 
        then 
            echo "Correct! You got it in $TRIES tries."
            exit 0
        fi
        if test $G -lt $NUM 
        then
            echo too low
        elif test $G -gt $NUM 
        then
            echo too high
        fi
        # guess not valid, add it too the list.
        GUESSES="$GUESSES $G"
    done
    echo "I was thinking of $NUM"
exit 1
