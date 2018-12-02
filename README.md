# Memb [![Build Status](https://travis-ci.org/jerben/memb.svg?branch=master)](https://travis-ci.org/jerben/memb)

A cli for managing a local text-base knowledge base.

## Installation

### Arch Linux

```
$ pacman -S memb
```

### Linux & macOS

Memb requires sed and grep to be installed.
Just move `memb` to your `$PATH`.

## Usage

```
Usage: memb <operation>


 Example usage: search for keywords 'untar' and 'zip'
    memb untar zip

 -a <sentence>
    Add <sentence> to the knowledge base.

 -p
    Print the content of the knowledge base.

 -d <line>
    Remove sentence at <line> from the knowledge base.
```
