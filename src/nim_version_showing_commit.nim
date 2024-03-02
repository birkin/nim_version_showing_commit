import std/parseopt


## import file created by `PRE_save_commit_hash.nim -----------------
include version
# echo "\ninitial version: ", commit_hash


## load args from command line --------------------------------------
var opt_parser = parseopt.initOptParser()
# echo "\nopt_parser: ", opt_parser

var kind = "init"
for kind, key, val in opt_parser.getopt():
    echo "\nin loop"
    echo "\nkind: ", kind, "; key: ", key, "; val: ", val

    if key == "version":
        echo "\nversion: ", commit_hash
    else:
        echo "\nUsage: $ ./nim_version_showing_commit --version"

echo "\nkind: ", kind
