function X = readImageFile(filename)
		[~,~,ext] = fileparts(filename);		
		[X, ~] = imread(filename);

%		if strcmp(ext, "png")
%			X = ind2rgb(X, [])

end

