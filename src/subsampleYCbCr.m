function [] = subsampleYCbCr(filename, figureNumber)

		% Read in image, 
		X = readImageFile(filename);

		yCbCr = rgb2ycbcr(X);

		% Trim image to nearest multiple of 8 
		yCbCr = trimToNearestMultiple(yCbCr, 8);

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

		imageSize = size(yCbCr);
		zeroIntensityMatrix = zeros(imageSize(1), imageSize(2));
		halfIntensityMatrix = 128 + zeroIntensityMatrix; 
		% Convert to RGB for rendering
		downsampledYCbCr= cat(3, y,					  Cb,				   Cr);
		yRGB  = ycbcr2rgb(cat(3, y,  				  halfIntensityMatrix, halfIntensityMatrix));
		CbRGB = ycbcr2rgb(cat(3, zeroIntensityMatrix, Cb, 				   halfIntensityMatrix));
		CrRGB = ycbcr2rgb(cat(3, zeroIntensityMatrix, halfIntensityMatrix, Cr));

		% Plots
		fig0 = figure(figureNumber);
		colorplot = subplot(1,1,1);
		imshow(ycbcr2rgb(downsampledYCbCr))
		title(colorplot, "Subsampled YCbCr Image")

		fig1 = figure(figureNumber+1);
		luminancePlot = subplot(1,1,1);
		imshow(yRGB);
		title(luminancePlot, "Y Component")

		fig2 = figure(figureNumber+2);
		CbPlot = subplot(1,1,1);
		imshow(CbRGB)
		title(CbPlot, "Chromatic Blue Components")

		fig3 = figure(figureNumber+3);
		CrPlot = subplot(1,1,1);
		imshow(CrRGB)
		title(CrPlot, "Chromatic Red Components")

		fig4 = figure(figureNumber+4);
		difference = ycbcr2rgb(yCbCr) - ycbcr2rgb(subsampledYCbCr);
		differencePlot = subplot(1,1,1);
		imshow(difference)
		title(differencePlot, "Difference in images")

		% Save figures to file
		%[~, filename, ~] = fileparts(filename);
		%dir = "images/task3/";
		%saveas(fig0, strcat(dir, filename, "sub.png"));
		%saveas(fig1, strcat(dir, filename, "y.png"));
		%saveas(fig2, strcat(dir, filename, "cb.png"));
		%saveas(fig3, strcat(dir, filename, "cr.png"));
		%saveas(fig4, strcat(dir, filename, "diff.png"));
end
