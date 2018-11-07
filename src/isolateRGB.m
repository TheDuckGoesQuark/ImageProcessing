function [red,green,blue] = isolateRGB(X)
%ISOLATERGB filters each colour plane into own matrix
% 
red = X(:,:,1);
green = X(:,:,2);
blue = X(:,:,3);
end

