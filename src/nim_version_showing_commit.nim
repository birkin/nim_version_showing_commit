import std/logging
import std/os
import std/parseopt
import std/tables


## import file created by `PRE_save_commit_hash.nim -----------------
include version


## set up logging -----------------------------------------------------
## grab level from envar ------------------------
let appLogLevel: string = os.getEnv("APP_LOG_LEVEL")
## get the level-obj ----------------------------
var log_level_dict = {
    "debug": lvlDebug,
    "info": lvlInfo
}.toTable()
var level_obj = log_level_dict[appLogLevel]
## instantiate logger ---------------------------
var logger = newConsoleLogger( levelThreshold=level_obj )
logger.log( lvlDebug, "level_obj, ", level_obj )
# logger.log( lvlInfo, "an info-level log message" )


## load args from command line --------------------------------------
var 
    opt_parser: OptParser = parseopt.initOptParser()
    versionFound: bool = false  # Flag to indicate whether --version is found
for kind, key, val in opt_parser.getopt():
    assert kind is CmdLineKind and key is string and val is string
    logger.log( lvlDebug, "kind: ", kind, "; key: ", key, "; val: ", val )
    ## display version --------------------------
    if kind == cmdLongOption and key == "version":
        echo "version: ", commit_hash
        versionFound = true
## or show usage --------------------------------
if not versionFound:
    echo "Usage: $ this_app --version"

logger.log( lvlInfo, "program complete" )
