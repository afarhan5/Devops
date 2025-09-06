#!/bin/bash

size=$1
type=$2

# Function to draw type 1 star pattern
draw_t1() {
    for ((i=1; i<=size; i++))
    do
        for ((j=size; j>i; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 2 star pattern
draw_t2() {
    for ((i=1; i<=size; i++))
    do
        for ((j=1; j<=i; j++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 3 star pattern
draw_t3() {
    for ((i=1; i<=size; i+=2))
    do
        for ((j=size; j>i/2; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 4 star pattern
draw_t4() {
    for ((i=size; i>=1; i--))
    do
        for ((j=1; j<=i; j++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 5 star pattern
draw_t5() {
    for ((i=size; i>=1; i--))
    do
        for ((j=size; j>i; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 6 star pattern
draw_t6() {
    for ((i=size; i>=1; i-=2))
    do
        for ((j=size; j>i/2; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

# Function to draw type 7 star pattern
draw_t7() {
    for ((i=1; i<=size; i+=2))
    do
        for ((j=size; j>i/2; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
    for ((i=size-2; i>=1; i-=2))
    do
        for ((j=size; j>i/2; j--))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

# Check for the type of star pattern and call the corresponding function
case $type in
    t1)
        draw_t1
        ;;
    t2)
        draw_t2
        ;;
    t3)
        draw_t3
        ;;
    t4)
        draw_t4
        ;;
    t5)
        draw_t5
        ;;
    t6)
        draw_t6
        ;;
    t7)
        draw_t7
        ;;
    *)
        echo "Invalid pattern type. Please use t1, t2, t3, t4, t5, t6, or t7."
        ;;
esac
