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
title = getTitle();

run("Find focused slices", "select=100 variance=0.000 select_only verbose log");

selectWindow("Find_Focus");

rename("Results");

focal_slice=getResult("Slice", 0);

getAverageFOV(focal_slice,title);

title = getTitle();
saveAs("Tiff", output + title); 
close();
// title = getTitle();
// saveAs(“Tiff”, output + title);
// close();
print(title);
print("Processing: " + input + File.separator + file);
print("Saving to: " + output);
}

function getAverageFOV(sliceNum,title_image){
startNum = sliceNum-1;
endNum = sliceNum+1;
selectWindow(title_image);
run("Z Project...", "start="+startNum+" stop="+endNum+" projection=[Average Intensity]");
}