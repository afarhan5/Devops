# Assignment 5

- It contain the Bash scripts of TemplateEngine & otTextEditor
  

# Part A - Template Engine


# Usage: 
- ./templateEngine.sh <template-file> key1=value1 key2=value2
  
# Example: 
- ./templateEngine.sh trainer.template fname=Sandeep topic=Linux
  
# Output:
- Sandeep is trainer of Linux

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Part B - otTextEditor Utility


# Commands
- ./otTextEditor addLineTop <file> <line>
- ./otTextEditor addLineBottom <file> <line>
- ./otTextEditor addLineAt <file> <linenumber> <line>
- ./otTextEditor updateFirstWord <file> <word1> <word2>
- ./otTextEditor updateAllWords <file> <word1> <word2>
- ./otTextEditor insertWord <file> <word1> <word2> <inserted-word>
- ./otTextEditor deleteLine <file> <linenumber>
- ./otTextEditor deleteLine <file> <linenumber> <word>

# Examples
- ./otTextEditor addLineTop notes.txt "Hello"
- ./otTextEditor addLineBottom notes.txt "Bye"
- ./otTextEditor updateFirstWord notes.txt Linux Ubuntu
- ./otTextEditor insertWord notes.txt is one not
