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
% imgYCbCr = rgb2ycbcr(X);

figure(1)
colorplot = subplot(2,2,1);
imshow(imgYCbCr)
title(colorplot, "Original Image (Full colour)")

% half intensity for all values in RGB
halfIntensityMatrix = 128 + zeros(size(X, 1), size(X,2));

yRGB = ycbcr2rgb(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
CbRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, Cb, halfIntensityMatrix));
CrRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

luminancePlot = subplot(2,2,2);
imshow(yRGB);
luminancePlotColorMap = zeros(256,3);
colormap(luminancePlot, luminancePlotColorMap);
colorbar
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(CbRGB)
cbColorMap = [zeros(256,1), linspace(0,1,256)', zeros(256,1)];
colormap(CbPlot, cbColorMap);
colorbar
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(CrRGB)
crColorMap = [zeros(256,2), linspace(0,1,256)'];
colormap(CrPlot, crColorMap);
colorbar
title(CrPlot, "Chromatic Red Components")
