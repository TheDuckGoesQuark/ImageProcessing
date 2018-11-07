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

% yCbCr?g = rgb2ycbcr(X);

figure(1)
colorplot = subplot(2,2,1);
imshow(yCbCr)
title(colorplot, "YCbCr Image")

% half intensity for all values in RGB
halfIntensityMatrix = 128 + zeros(size(X, 1), size(X,2));

% Convert to RGB for rendering
yRGB = ycbcr2rgb(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
CbRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, Cb, halfIntensityMatrix));
CrRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

luminancePlot = subplot(2,2,2);
imshow(yRGB);
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(CbRGB)
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(CrRGB)
title(CrPlot, "Chromatic Red Components")
