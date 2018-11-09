function [] = showDCT(filename, figureNumber)

		X = readImageFile(filename);
		yCbCr = rgb2ycbcr(X);

		% Seperate channels
		y = yCbCr(:,:,1);
		Cb = yCbCr(:,:,2);
		Cr = yCbCr(:,:,3);

		% DCT on each channel
		y = dct2(y);
		Cb = dct2(Cb);
		Cr = dct2(Cr);

		% half intensity for all values in RGB
		halfIntensityMatrix = 128 + zeros(size(X, 1), size(X,2));

		% Convert to RGB for rendering
		yRGB = ycbcr2rgb(cat(3,y,halfIntensityMatrix, halfIntensityMatrix));
		CbRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, Cb, halfIntensityMatrix));
		CrRGB = ycbcr2rgb(cat(3, halfIntensityMatrix, halfIntensityMatrix, Cr));

		figure(figureNumber)

		fullplot = subplot(2,2,1);
		imshow(ycbcr2rgb(yCbCr))
		title(fullplot, "Full Image")

		luminancePlot = subplot(2,2,2);
		imshow(yRGB);
		title(luminancePlot, "Y Component")

		CbPlot = subplot(2,2,3);
		imshow(CbRGB)
		title(CbPlot, "Chromatic Blue Components")

		CrPlot = subplot(2,2,4);
		imshow(CrRGB)
		title(CrPlot, "Chromatic Red Components")
