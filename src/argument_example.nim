## from <https://nim-lang.org/docs/osproc.html>


import std/parseopt

## demo -------------------------------------------------------------
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


## trying -----------------------------------------------------------
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

echo "eof"