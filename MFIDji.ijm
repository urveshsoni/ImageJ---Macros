//MFIDji - Magnetic Field Induced Interchain Distance in the Magnetic Nanofluid

//Dated: 12-09-2021

//Urveshkumar Soni and Rucha Desai

//Macro for ImageJ. Determination of the magnetic field induced microstructure's successive distance in the magnetic nanofluid

//the developed protocol gives the inter chain distance of the microstructures

//promted user to select the microscopic image without external magntic field
waitForUser("Select the microscopic image without external magnetic field (H = 0 T)");

//stroe the image of the selected image into the namemicroscopicimagewithoutexternalmagneticfield variable
namemicroscopicimagewithoutexternalmagneticfield = getTitle();

//setTool("line") to calibrate the microscopic image with ImageJ software;
waitForUser("Calibrate the microscopic image with ImageJ software");

//makeLine(1506, 1404, 1971, 1404);
//run("Set Scale...", "distance=465 known=200 unit=um global");


//promted user to select the microscopic image with external magntic field
waitForUser("Select the microscopic image with external magnetic field (H ≠ 0 T)");

//stroe the image of the selected image into the namemicroscopicimagewithexternalmagneticfield variable
namemicroscopicimagewithexternalmagneticfield = getTitle();

//in order to get only microstructures, sustract the microscopic image with external magnetic field from without external magnetic field
//the calculator plus operation will create the new window
run("Calculator Plus", "i1=[namemicroscopicimagewithoutexternalmagneticfield] i2=[namemicroscopicimagewithexternalmagneticfield] operation=[Subtract: i2 = (i1-i2) x k1 + k2] k1=1 k2=0 create");

//the smooth tool allow the microstructures to adjust the intensity 
run("Smooth");

//convert the colour microscopic image into 16-bit grey scale
run("16-bit");

//to adjust brightness and contrast of the microstructures
run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");

//Apply a threshold tool on microscopic image to make the microstructures into white 
run("Auto Threshold", "method=Default white");
setOption("BlackBackground", true);

//Invert tool convert white microstructures into black
run("Invert");

//Distance map tool is use to measure the successive distance between microstructures
run("Distance Map");

//to convert binary image into colour 
run("16_colors");

//apply minimum threshold mannually
setAutoThreshold("Default dark no-reset");
//run("Threshold...");

//select the options, in order to display the output
run("Set Measurements...", "area mean bounding display redirect=None decimal=3");

//the mean value is the successive distance between microstructures
run("Measure");