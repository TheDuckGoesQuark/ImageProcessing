% https://www.w3.org/Graphics/JPEG/jfif3.pdf
% Page 3

clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

yCbCr = rgb2ycbcr(X);

y = yCbCr(:,:,1);
Cb = yCbCr(:,:,2);
Cr = yCbCr(:,:,3);

imageCells = imageToCells(yCbCr, [8,8]);


% Convert to RGB for rendering
yCbCr = cat(3, y,					  Cb,				   Cr);
yRGB  = ycbcr2rgb(cat(3, y,  				  halfIntensityMatrix, halfIntensityMatrix));
CbRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, Cb, 				   halfIntensityMatrix));
CrRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

% Plots
figure(1)
colorplot = subplot(2,2,1);
imshow(yCbCr)
title(colorplot, "Downsampled YCbCr Image")

luminancePlot = subplot(2,2,2);
imshow(yRGB);
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(CbRGB)
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(CrRGB)
title(CrPlot, "Chromatic Red Components")
