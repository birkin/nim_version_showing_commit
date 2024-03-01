# import osproc, os

## Package ----------------------------------------------------------

version       = "0.1.0"
author        = "Birkin James Diana"
description   = "Experiments with `.nimble` file."
license       = "MIT"
srcDir        = "src"
bin           = @["nim_version_showing_commit"]


## Dependencies -----------------------------------------------------

requires "nim >= 2.0.2"


## Tasks ------------------------------------------------------------

task runPreAndMain, "Runs pre.nim and then main.nim":
  exec "nim c -r ./src/PRE_save_commit_hash.nim"
  exec "nim c -r ./src/nim_version_showing_commit.nim"
