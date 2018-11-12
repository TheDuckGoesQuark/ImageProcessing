function [] = customShowYCbCr(filename, figureNumber)
		% Read in image, 
		X = readImageFile(filename);

		[r,g,b] = isolateRGB(X);
		[y,Cb,Cr] = rgbToYCbCr(r,g,b);
		imgYCbCr=cat(3,y,Cb,Cr);

		fig0 = figure(figureNumber)
		colorplot = subplot(2,2,1);
		imshow(imgYCbCr)
		title(colorplot, "YCbCr Image")

		% half intensity for all values in RGB
		zeroIntensityMatrix = zeros(size(X, 1), size(X, 2));
		halfIntensityMatrix = 128 + zeroIntensityMatrix;

		% Convert to RGB for rendering
		yRGB = YCbCrToRGB(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
		CbRGB = YCbCrToRGB(cat(3, zeroIntensityMatrix, Cb, halfIntensityMatrix));
		CrRGB = YCbCrToRGB(cat(3, zeroIntensityMatrix, halfIntensityMatrix, Cr));

		luminancePlot = subplot(2,2,2);
		imshow(yRGB);
		title(luminancePlot, "Y Component")

		CbPlot = subplot(2,2,3);
		imshow(CbRGB)
		title(CbPlot, "Chromatic Blue Components")

		CrPlot = subplot(2,2,4);
		imshow(CrRGB)
		title(CrPlot, "Chromatic Red Components")
		
		% Save figures to file
		[~, filename, ~] = fileparts(filename);
		dir = "images/task2/";
		saveas(fig0, strcat(dir, filename, "custom.png"), "png");
end
