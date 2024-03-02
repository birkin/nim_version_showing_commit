## from <https://nim-lang.org/docs/osproc.html>


import std/parseopt

## demo -------------------------------------------------------------
echo "Demo options..."
var p = initOptParser("-ab -e:5 --foo --bar=20 file.txt")
echo "p, in demo, ", p
while true:
    p.next()
    case p.kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
        if p.val == "":
            echo "Option: ", p.key
        else:
            echo "Option and value: ", p.key, ", ", p.val
    of cmdArgument:
        echo "Argument: ", p.key


## experiment -------------------------------------------------------
echo "\nSubmitted options..."
var opt_parser = initOptParser()
while true:
    opt_parser.next()
    case opt_parser.kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
        if opt_parser.val == "":
            echo "Submitted option: ", opt_parser.key
        else:
            echo "Submitted option and value: ", opt_parser.key, ", ", opt_parser.val
    of cmdArgument:
        echo "Submitted argument: ", opt_parser.key


## experiment 2 -----------------------------------------------------
## <https://nim-lang.org/docs/parseopt.html#getopt.i%2COptParser>
echo "\nTrying getopt() iterator ..."

var
  opt_parser2: OptParser = initOptParser()
  versionFound: bool = false  # Flag to indicate whether --version is found

# Iterate over each command-line argument
for kind, key, val in opt_parser2.getopt():
    assert kind is CmdLineKind and key is string and val is string
    echo "kind: ", kind, ", key: ", key, ", val: ", val
    # Check if the current argument is --version
    if kind == cmdLongOption and key == "version":
        echo "Application version: 1.0.0"  # Or your actual version here
        versionFound = true

# After iterating through all arguments, check if --version was found
if not versionFound:
    echo "Usage: $ this_app --version"


## experiment 3 -----------------------------------------------------
echo "\nChecking for --version option..."

var
  opt_parser_b = initOptParser()
  versionFoundB = false  # Flag to track if --version is found

while true:
    opt_parser_b.next()
    case opt_parser_b.kind
    of cmdEnd: break  # Exit loop when no more arguments
    of cmdLongOption:
        if opt_parser_b.key == "version":
            echo "Application version: 1.0.0"  # Example version output
            versionFoundB = true  # Set flag to true when --version is found
        else:
            # Handle other long options here
            discard
    of cmdShortOption, cmdArgument:
        # Handle short options and arguments here
        discard

if not versionFound:
    # If --version wasn't found, print usage message
    echo "Usage: $ this_app --version"


echo "\n--eof--"