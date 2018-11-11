clear;

files = ["images/colourful.jpg", "images/simple.jpg", "images/drawing.png"];

for i = 1:length(files) 
	showRGB(files(i), getNextFigureNumber());
end
