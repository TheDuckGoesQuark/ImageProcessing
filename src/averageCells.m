function averagedCells = averageCells(imageCells)
    averagedCells = cellfun(@averageMatrix, imageCells, 'UniformOutput', false);
end
