function num = getNextFigureNumber()
	figures = findobj('type', 'figure');
	num = length(figures);
	if (num == 0) 
		num = 1;
	end
end
