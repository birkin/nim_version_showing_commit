import osproc, strutils

## get commit-hash ------------------------------
var commit_hash: string = osproc.execProcess( "git", args=["rev-parse", "HEAD"], options = {poUsePath, poStdErrToStdOut} ).strip()

## write commit-hash to a file ------------------
writeFile( "src/version.nim", "const commit_hash = \"" & commit_hash & "\"" )
