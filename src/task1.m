clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

[r,g,b] = isolateRGB(X);

figure(1)
colorplot = subplot(2,2,1);
imshow(X)
title(colorplot, "Original Image (Full colour)")

redplot = subplot(2,2,2);
imshow(r)
redcolormap = [linspace(0,1,256)', zeros(256,2)];
colormap(redplot, redcolormap);
colorbar
title(redplot, "Red Components")

greenplot = subplot(2,2,3);
imshow(g)
greencolormap = [zeros(256,1), linspace(0,1,256)', zeros(256,1)];
colormap(greenplot, greencolormap);
colorbar
title(greenplot, "Green Components")

blueplot = subplot(2,2,4);
imshow(b)
bluecolormap = [zeros(256,2), linspace(0,1,256)'];
colormap(blueplot, bluecolormap);
colorbar
title(blueplot, "Blue Components")
