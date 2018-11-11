function [] = showDCT(filename, figureNumber)

		X = readImageFile(filename);
		yCbCr = rgb2ycbcr(X);

		% Seperate channels
		y = yCbCr(:,:,1);
		Cb = yCbCr(:,:,2);
		Cr = yCbCr(:,:,3);

		% DCT on luminance channel for spatial frequency 
		dcty = dct2(y);
		dctCb = dct2(Cb);
		dctCr = dct2(Cr);
	    
		% Show results of DCT
		figure(figureNumber)

		fullplot = subplot(2,2,1);
		imshow(X)
		title(fullplot, "Full Image")

		dctplot = subplot(2,2,2);
		imshow(log(abs(dcty)));
		axis square, colorbar
		title(dctplot, "Y Component")

		CbPlot = subplot(2,2,3);
		imshow(log(abs(dctCr)));
		title(CbPlot, "Chromatic Blue Components")

		CrPlot = subplot(2,2,4);
		imshow(log(abs(dctCb)));
		title(CrPlot, "Chromatic Red Components")

		%% Extension - Show high and low frequency components
		%% 			   as used in JPEG compression

		cutoff = 0.5 * 256;
		highFrequencies = fliplr(tril(fliplr(dcty), cutoff));
		lowFrequencies = dcty - highFrequencies;
				
		figure(figureNumber + 1)

		lowFreqPlot = subplot(1,2,1);
		imshow(idct2(lowFrequencies));
		axis square, colorbar
		title(lowFreqPlot, "Low Frequency Components")

		highFreqPlot = subplot(1,2,2);
		imshow(idct2(highFrequencies));
		axis square, colorbar
		title(highFreqPlot, "High Frequency Component")
end
