function [] = showYCbCr(filename, figureNumber)
		
		% Read in image, 
		X = readImageFile(filename);

		yCbCr = rgb2ycbcr(X);
		y = yCbCr(:,:,1);
		Cb = yCbCr(:,:,2);
		Cr = yCbCr(:,:,3);

		fig0 = figure(figureNumber)
		colorplot = subplot(1,1,1);
		imshow(yCbCr)
		title(colorplot, "YCbCr Image")

		% half intensity for all values in RGB
		zeroIntensityMatrix = zeros(size(X, 1), size(X, 2));
		halfIntensityMatrix = 128 + zeroIntensityMatrix;

		% Convert to RGB for rendering
		yRGB = ycbcr2rgb(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
		CbRGB = ycbcr2rgb(cat(3, zeroIntensityMatrix, Cb, halfIntensityMatrix));
		CrRGB = ycbcr2rgb(cat(3, zeroIntensityMatrix, halfIntensityMatrix, Cr));

		fig1 = figure(figureNumber+1);
		luminancePlot = subplot(1,1,1);
		imshow(yRGB);
		title(luminancePlot, "Y Component");

		fig2 = figure(figureNumber+2);
		CbPlot = subplot(1,1,1);
		imshow(CbRGB);
		title(CbPlot, "Chromatic Blue Components");

		fig3 = figure(figureNumber+3);
		CrPlot = subplot(1,1,1);
		imshow(CrRGB);
		title(CrPlot, "Chromatic Red Components");

		% Save figures to file
		[~, filename, ~] = fileparts(filename);
		dir = "images/task2/";
		saveas(fig1, strcat(dir, filename, "y.png"));
		saveas(fig2, strcat(dir, filename, "cb.png"));
		saveas(fig3, strcat(dir, filename, "cr.png"));
end
