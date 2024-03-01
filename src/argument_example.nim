## from <https://nim-lang.org/docs/osproc.html>


import std/parseopt

## demo -------------------------------------------------------------
echo "Demo options..."
var p = initOptParser("-ab -e:5 --foo --bar=20 file.txt")
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


## experimenting ----------------------------------------------------
echo "\nSubmitted options..."
var opt_parser = initOptParser()
while true:
  opt_parser.next()
  case opt_parser.kind
  of cmdEnd: break
  of cmdShortOption, cmdLongOption:
    if opt_parser.val == "":
      echo "Submitted option: ",  opt_parser.key
    else:
      echo "Submitted option and value: ", opt_parser.key, ", ", opt_parser.val
  of cmdArgument:
    echo "Submitted argument: ", opt_parser.key


## experimenting 2 --------------------------------------------------
## <https://nim-lang.org/docs/parseopt.html#getopt.i%2COptParser>
echo "\ntrying getopt() iterator ..."

var opt_parser2 = initOptParser()
for kind, key, val in opt_parser2.getopt():
    echo "kind: ", kind, ", key: ", key, ", val: ", val

echo "\n--eof--"