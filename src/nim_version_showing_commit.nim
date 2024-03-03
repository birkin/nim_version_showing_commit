import std/parseopt
import std/logging


## import file created by `PRE_save_commit_hash.nim -----------------
include version


## set up logging -----------------------------------------------------
var logger = newConsoleLogger( levelThreshold=lvlDebug )
logger.log( lvlInfo, "a log message" )


## load args from command line --------------------------------------
var 
    opt_parser: OptParser = parseopt.initOptParser()
    versionFound: bool = false  # Flag to indicate whether --version is found
for kind, key, val in opt_parser.getopt():
    assert kind is CmdLineKind and key is string and val is string
    # echo "\nkind: ", kind, "; key: ", key, "; val: ", val
    logger.log( lvlDebug, "kind: ", kind, "; key: ", key, "; val: ", val )
    if kind == cmdLongOption and key == "version":
        echo "version: ", commit_hash
        versionFound = true
if not versionFound:
    echo "Usage: $ this_app --version"
