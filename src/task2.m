% https://www.w3.org/Graphics/JPEG/jfif3.pdf
% Page 3

clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

[r,g,b] = isolateRGB(X);
[y,Cb,Cr] = rgbToYCbCr(r,g,b);

figure(1)
colorplot = subplot(2,2,1);
imshow(X)
title(colorplot, "Original Image (Full colour)")

luminancePlot = subplot(2,2,2);
imshow(y)
luminancePlotColorMap = zeros(256,3);
colormap(luminancePlot, luminancePlotColorMap);
colorbar
title(luminancePlot, "Y Component")

CbPlot = subplot(2,2,3);
imshow(Cb)
cbColorMap = [zeros(256,1), linspace(0,1,256)', zeros(256,1)];
colormap(CbPlot, cbColorMap);
colorbar
title(CbPlot, "Chromatic Blue Components")

CrPlot = subplot(2,2,4);
imshow(Cr)
crColorMap = [zeros(256,2), linspace(0,1,256)'];
colormap(CrPlot, crColorMap);
colorbar
title(CrPlot, "Chromatic Red Components")
