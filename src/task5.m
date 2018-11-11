clear;

file = "images/heart_rate_vid.MOV";

% Read in file
v = VideoReader(file);

% Calculate number of frames
frameRate = v.FrameRate;
duration = v.Duration;
frameDuration = 1 / frameRate;
numberOfFrames = floor(duration / frameDuration);

% Calculate average luminance for each frame
averages = zeros(numberOfFrames);
timeaxis = 0:frameDuration:((numberOfFrames*frameDuration)-frameDuration);
for i = 1:numberOfFrames
	frame = read(v,i);
	ycbcr = rgb2ycbcr(frame);
	luminance = ycbcr(:,:,1);
	averages(i) = mean(luminance, 'all');
end

% Normalise values to centre at 0 
maxValue = max(averages);
averages = averages / maxValue;
middleValue = mean(averages);
averages = averages - middleValue;


nyquistLimit = ceil(frameRate / 2);
fourierTransform = fft(averages);
fourierTransform = fftshift(fourierTransform);
magnitudeAxis = abs(fourierTransform(length(fourierTransform) / 2 : length(fourierTransform)));
frequencyAxis = nyquistLimit * linspace(0, 1, length(magnitudeAxis));

fig0 = figure(getNextFigureNumber());

luminancePlot = subplot(2, 1, 1);
plot(timeaxis, averages);
grid on;
title(luminancePlot, "Normalied Average Luminance Value Over Time");

freqplot = subplot(2, 1, 2);
plot(frequencyAxis, magnitudeAxis);
title(freqplot, "FFT of Average Luminance Over Time");

% Save figures to file
%saveas(fig0, "Frequency.png");

