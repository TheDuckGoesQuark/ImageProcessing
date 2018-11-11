clear;

files = ["images/colourful.jpg", "images/simple.jpg", "images/drawing.png"];

for i = 1:length(files) 
	showDCT(files(i), getNextFigureNumber());
end
