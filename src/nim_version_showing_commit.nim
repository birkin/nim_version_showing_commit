# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

include version

when isMainModule:
    echo("Hello, World!")
    # echo "Version: " &  version.commit_hash 
    echo( "Version: " & commit_hash ) 
