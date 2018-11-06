function [red,green,blue] = isolateRGB(X)
%ISOLATERGB filters each colour plane into own matrix
% 
zeroedMatrix = uint8(zeros(size(X)));

zeroedMatrix(:,:,1) = 1;
red = zeroedMatrix .* X;

zeroedMatrix(:,:,1) = 0;
zeroedMatrix(:,:,2) = 1;
green = zeroedMatrix .* X;

zeroedMatrix(:,:,2) = 0;
zeroedMatrix(:,:,3) = 1;
blue = zeroedMatrix .* X;
end

