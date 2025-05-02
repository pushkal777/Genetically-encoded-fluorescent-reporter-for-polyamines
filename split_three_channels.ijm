//@ File (label = "Input directory", style = "directory") input
//@ File (label = "Output directory", style = "directory") output
//@ String (label = "File suffix", value = ".tif") suffix

// See also Process_Folder.py for a version of this code
// in the Python scripting language.

print (input);
print (output) ;

input += File.separator;
output += File.separator;

print (input);
print (output) ;


processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
list = getFileList(input);
list = Array.sort(list);
Array.print(list);
//waitForUser("");

for (i = 0; i < list.length; i++) {
	if(File.isDirectory(input + File.separator + list[i]))
		processFolder(input + File.separator + list[i]);
	if(endsWith(list[i], suffix))
		processFile(input, output, list[i]);
 }
}

function processFile(input, output, file) {
// Do the processing here by adding your own code.
// Leave the print statements until things work, then remove them.

open(input + file);
run("Split Channels");
title = getTitle();
saveAs("Tiff", output + title); 
close();
title = getTitle();
saveAs("Tiff", output + title); 
close();
title = getTitle();
saveAs("Tiff", output + title); 
close();
print(title);
print("Processing: " + input + File.separator + file);
print("Saving to: " + output);
}

