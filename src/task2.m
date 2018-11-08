clear;

files = ["images/colourful.jpg", "images/simple.jpg", "images/drawing.png"];

for i = 1:length(files) 
	showYCbCr(files(i), i);
	%customShowYCbCr(files(i), i);
end
