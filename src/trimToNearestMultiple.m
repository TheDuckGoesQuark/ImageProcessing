function matrix = trimToNearestMultiple(original, mul) 
	nearest = floor(size(original) / mul);
	matrix = original(1:nearest(1)*mul, 1:nearest(2)*mul, :);
end
