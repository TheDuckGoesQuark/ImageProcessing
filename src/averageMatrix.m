function matrix = averageMatrix(matrix)
	avg = mean2(matrix);
	matrix = avg * ones(size(matrix));
end
