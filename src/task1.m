clear;

% Read in image, 
filename = 'images/colourful.jpg';
info = imfinfo(filename);
[X, ~] = imread(filename);

[r,g,b] = isolateRGB(X);

figure(1)
subplot(2,2,1);
imshow(X)

redplot = subplot(2,2,2);
imshow(r)
redcolormap = [linspace(0,1,256)', zeros(256,2)];
colormap(redplot, redcolormap);
colorbar

greenplot = subplot(2,2,3);
imshow(g)
greencolormap = [zeros(256,1), linspace(0,1,256)', zeros(256,1)];
colormap(greenplot, greencolormap);
colorbar

blueplot = subplot(2,2,4);
imshow(b)
bluecolormap = [zeros(256,2), linspace(0,1,256)'];
colormap(blueplot, bluecolormap);
colorbar
