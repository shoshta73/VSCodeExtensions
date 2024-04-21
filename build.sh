function install_extensions {
    # Declare an array to hold the file names
    declare -a files
    # Use find to search for .txt files and loop through the results
    while IFS= read -r -d '' file; do
        # Add each file to the array
        files+=("$file")
    done < <(find . -type f -name "*.vsix" -print0)
    # Print the array to verify the files were added
    echo "Files found:"
    for file in "${files[@]}"; do
        code --install-extension $file
    done
}

cd themes
vsce package
mv themes-0.0.1.vsix ../
cd ..

cd c-cpp
vsce package
mv c-cpp-0.0.1.vsix ../
cd ..

cd csharpdotnet
vsce package
mv csharpdotnet-0.0.1.vsix ../
cd ..

cd gocode
vsce package
mv gocode-0.0.1.vsix ../
cd ..

cd commons
vsce package
mv commons-0.0.1.vsix ../
cd ..

install_extensions
