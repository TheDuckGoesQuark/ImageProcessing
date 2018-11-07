% https://www.w3.org/Graphics/JPEG/jfif3.pdf
% Page 3

clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

[r,g,b] = isolateRGB(X);
[y,Cb,Cr] = rgbToYCbCr(r,g,b);
imgYCbCr=cat(3,y,Cb,Cr);

figure(2)
colorplot = subplot(2,2,1);
imshow(imgYCbCr)
title(colorplot, "YCbCr Image")

% half intensity for all values in RGB
halfIntensityMatrix = 128 + zeros(size(X, 1), size(X,2));

% Convert to RGB for rendering
yRGB = YCbCrToRGB(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
CbRGB = YCbCrToRGB(cat(3, halfIntensityMatrix, Cb, halfIntensityMatrix));
CrRGB = YCbCrToRGB(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

luminancePlot = subplot(2,2,2);
imshow(yRGB);
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(CbRGB)
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(CrRGB)
title(CrPlot, "Chromatic Red Components")
