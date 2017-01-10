# Package

version       = "0.1.0"
author        = "RT"
description   = "Linked list implementation"
license       = "MIT"

bin = @["linkedlist"]
srcDir = "src"

# Dependencies

requires "nim >= 0.16.0"

task run, "run binary":
  withDir "src":
    exec "nim c -r linkedlist"
