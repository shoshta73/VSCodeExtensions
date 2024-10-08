#!/bin/bash
# set -x
set -e

DIRS=$(find . -maxdepth 1 -type d | grep -v '.git' | grep -v ".vscode" | grep -v "node_modules" | sed -e 's,^\.\/,,' | grep -v "\.")

for dir in $DIRS; do
    echo "Building $dir"
    cd $dir
    # npm version patch --no-git-tag-version
    ../node_modules/.bin/vsce package
    vsixFile=$(find . -maxdepth 1 -type f -name "*.vsix")
    echo $vsixFile
    mv $vsixFile ..
    cd ..
done

echo "Creating tarball"
tar -czvf extensions.tar.gz ./*.vsix

echo "Cleaning up"
rm -rfv ./*.vsix
