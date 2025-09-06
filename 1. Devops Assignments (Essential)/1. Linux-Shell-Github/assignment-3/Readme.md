# Assignment-3

- This repository contains solutions to basic shell scripting with conditions and loops.

# Files
- drawStar.sh — A script to draw stars in different patterns.
- printTomcat.sh — A script to print `tom`, `cat`, or `tomcat` based on divisibility.


# Part A:- Star Drawing Script

# File: `drawStar.sh`
# Usage: ./drawStar.sh <size> <type>
# Arguments:
- size - Number of lines.
- type - Type of pattern:
- t1 → Right-aligned triangle
- t2 → Left-aligned triangle
- t3 → Pyramid
- t4 → Inverted left-aligned triangle
- t5 → Inverted right-aligned triangle
- t6 → Inverted pyramid
- t7 → Diamond shape

# Examples
- ./drawStar.sh 5 t1
- ./drawStar.sh 5 t3
- ./drawStar.sh 5 t7

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Part B: TomCat Checker Script

# File: printTomcat.sh
# Usage: ./printTomcat.sh <number>
# Output Logic:
- Prints tomcat if divisible by 15
- Prints tom if divisible by 3
- Prints cat if divisible by 5
- Prints the number if divisible by none

# Examples:-
- ./printTomcat.sh 7     # Output: 7
- ./printTomcat.sh 6     # Output: tom
- ./printTomcat.sh 10    # Output: cat
- ./printTomcat.sh 30    # Output: tomcat

