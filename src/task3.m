% https://www.w3.org/Graphics/JPEG/jfif3.pdf
% Page 3

clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

yCbCr = rgb2ycbcr(X);

% Break each image into cells
imageCells = imageToCells(yCbCr, [8,8]);

% Replace all values on CbCr planes
imageCells = averageCells(imageCells);

averagedYCbCr = cell2mat(imageCells);
subsampledYCbCr = yCbCr;
for channel = [2,3] 
	subsampledYCbCr(:,:,channel) = averagedYCbCr(:,:,channel);
end

y = subsampledYCbCr(:,:,1);
Cb = subsampledYCbCr(:,:,2);
Cr = subsampledYCbCr(:,:,3);

imageSize = size(X);
halfIntensityMatrix = 128 + zeros(imageSize(1), imageSize(2));

% Convert to RGB for rendering
downsampledYCbCr= cat(3, y,					  Cb,				   Cr);
yRGB  = ycbcr2rgb(cat(3, y,  				  halfIntensityMatrix, halfIntensityMatrix));
CbRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, Cb, 				   halfIntensityMatrix));
CrRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

% Plots
figure(2)
colorplot = subplot(2,2,1);
imshow(ycbcr2rgb(subsampledYCbCr))
title(colorplot, "Subsampled YCbCr Image")

luminancePlot = subplot(2,2,2);
imshow(yRGB);
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(CbRGB)
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(CrRGB)
title(CrPlot, "Chromatic Red Components")

figure(3)
difference = ycbcr2rgb(yCbCr) - ycbcr2rgb(subsampledYCbCr);
differencePlot = subplot(1,1,1);
imshow(difference)
title(differencePlot, "Difference in images")
