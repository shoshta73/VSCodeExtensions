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

cd vue/
vsce package
cd ..
cd gocode/
vsce package
cd ..
cd react/
vsce package
cd ..
cd rust/
vsce package
cd ..
cd tauri/
vsce package
cd ..
cd themes/
vsce package
cd ..
cd c-cpp/
vsce package
cd ..
cd commons/
vsce package
cd ..
cd csharpdotnet/
vsce package
cd ..

install_extensions
