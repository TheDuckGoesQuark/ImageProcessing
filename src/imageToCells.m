function imageCells = imageToCells(image, cellDimensions)
	imageDimensions = size(image);
	rowsInBlock = cellDimensions(1);
	colsInBlock = cellDimensions(2);
	
	wholeBlockRows = floor(imageDimensions(1) / rowsInBlock);
	wholeBlockCols = floor(imageDimensions(2) / colsInBlock);

	blockRowDims = [rowsInBlock * ones(wholeBlockRows, 1)];
	blockColDims = [colsInBlock * ones(wholeBlockCols, 1)];
	
	imageCells = mat2cell(image, blockRowDims, blockColDims, [1,1,1]);

	celldisp(imageCells)
end
