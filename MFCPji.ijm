//MFCPji - Magnetic Field Induced Chain Parameters in the Magnetic Nanofluid

//Dated: 12-09-2021

//Urveshkumar Soni and Rucha Desai

//Macro for ImageJ. Determination of the magnetic field induced structure parameters such as length, width, and count in the magnetic nanofluid


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

//dilate tool is use to see the edges of the microstructures clearly 
run("Dilate");

//go to select Analyze > Set Measurements, and select options like area, and bounding rectangles
//The option bounding rectangles will not restrict to rectangular or square, but it means a frame or boundary of the structure 
run("Set Measurements...", "area bounding display redirect=None decimal=3");

//select analyze particle tool under the Analyze menu. 
//Along with the final image, it will generate two tables, one for summary and other for individual microstructure parameters (such as area, length, width). 
run("Analyze Particles...", "  show=Outlines display exclude summarize add in_situ");