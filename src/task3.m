clear;

files = ["images/colourful.jpg", "images/simple.jpg", "images/drawing.png"];

for i = 1:length(files) 
	subsampleYCbCr(files(i), 2*i);
end
