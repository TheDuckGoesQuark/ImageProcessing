clear;

files = ["images/colourful.jpg", "images/simple.jpg", "images/drawing.png"];

for i = 1:length(files) 
	showYCbCr(files(i), getNextFigureNumber());
	customShowYCbCr(files(i), getNextFigureNumber());
end
