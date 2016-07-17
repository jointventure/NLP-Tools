#!/usr/bin/env python3
"""Read a file and write its content with replacements in a second file."""
import re


def sed(pattern, replace, source, dest):
    """Read a source file and writes the destination file.

    In each line, replaces pattern with replace.

    pattern: string
    replace: string
    source: string filename
    dest: string filename
    """
    fin = open(source, 'r')
    fout = open(dest, 'w')

    for line in fin:
        line = re.sub(pattern, replace, line)
        fout.write(line)

    fin.close()
    fout.close()


def main():
    """Define the replace pattern and files."""
    pattern = '(.+\.py)'
    replace = '\\1 - Python'
    source = 'files.txt'
    dest = source + '.out'
    sed(pattern, replace, source, dest)

if __name__ == '__main__':
    main()
