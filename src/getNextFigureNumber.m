function num = getNextFigureNumber()
	figures = findobj('type', 'figure');
	num = length(figures) + 1;
end
