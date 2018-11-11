function [] = showRGB(filename, figureNumber)

		% Read in image, 
		X = readImageFile(filename);
		[r,g,b] = isolateRGB(X);

		fig0 = figure(figureNumber);
		colorplot = subplot(1,1,1);
		imshow(X);
		title(colorplot, "Original Image (Full colour)");

		fig1 = figure(figureNumber + 1);
		redplot = subplot(1,1,1);
		imshow(r);
		redcolormap = [linspace(0,1,256)', zeros(256,2)];
		colormap(redplot, redcolormap);
		colorbar;
		title(redplot, "Red Components");

		fig2 = figure(figureNumber + 2);
		greenplot = subplot(1,1,1);
		imshow(g);
		greencolormap = [zeros(256,1), linspace(0,1,256)', zeros(256,1)];
		colormap(greenplot, greencolormap);
		colorbar;
		title(greenplot, "Green Components");

		fig3 = figure(figureNumber + 3);
		blueplot = subplot(1,1,1);
		imshow(b);
		bluecolormap = [zeros(256,2), linspace(0,1,256)'];
		colormap(blueplot, bluecolormap);
		colorbar;
		title(blueplot, "Blue Components");

		% Save figures to file
		saveas(fig1, strcat(filename, "r.png")); saveas(fig2, strcat(filename, "g.png"));
		saveas(fig3, strcat(filename, "b.png"));
end
