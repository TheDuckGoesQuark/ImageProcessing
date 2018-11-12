function [] = showDCT(filename, figureNumber)

		X = readImageFile(filename);
		yCbCr = rgb2ycbcr(X);

		% Seperate channels
		y = yCbCr(:,:,1);
		Cb = yCbCr(:,:,2);
		Cr = yCbCr(:,:,3);

		% DCT on each channel 
		dcty = dct2(y);
		dctCb = dct2(Cb);
		dctCr = dct2(Cr);
	    
		% Show results of DCT
		fig0 = figure(figureNumber);
		fullplot = subplot(1,1,1);
		imshow(X)
		title(fullplot, "Full Image")

		fig1 = figure(figureNumber+1);
		dctplot = subplot(1,1,1);
		imshow(log(abs(dcty)));
		axis square, colorbar
		title(dctplot, "Y Component")

		fig2 = figure(figureNumber+2);
		CbPlot = subplot(1,1,1);
		imshow(log(abs(dctCr)));
		axis square, colorbar
		title(CbPlot, "Chromatic Blue Components")

		fig3 = figure(figureNumber+3);
		CrPlot = subplot(1,1,1);
		imshow(log(abs(dctCb)));
		axis square, colorbar
		title(CrPlot, "Chromatic Red Components")

		%% Extension - Show high and low frequency components
		%% 			   as used in JPEG compression

		cutoff = 0.5 * 256;
		highFrequencies = fliplr(tril(fliplr(dcty), cutoff));
		lowFrequencies = dcty - highFrequencies;

		fig4 = figure(figureNumber+4);
		lowFreqPlot = subplot(1,1,1);
		imshow(idct2(lowFrequencies));
		title(lowFreqPlot, "Low Frequency Components")

		fig5 = figure(figureNumber+5);
		highFreqPlot = subplot(1,1,1);
		imshow(idct2(highFrequencies));
		title(highFreqPlot, "High Frequency Component")

		% Save figures to file
		[~, filename, ~] = fileparts(filename);
		dir = "images/task4/";
		saveas(fig1, strcat(dir, filename, "y.png"));
		saveas(fig2, strcat(dir, filename, "cb.png"));
		saveas(fig3, strcat(dir, filename, "cr.png"));
		saveas(fig4, strcat(dir, filename, "lf.png"));
		saveas(fig5, strcat(dir, filename, "hf.png"));
end
