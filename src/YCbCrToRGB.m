function rgb = YCbCrToRGB(yCbCr)
	y = yCbCr(:,:,1);
	Cb = yCbCr(:,:,2);
	Cr = yCbCr(:,:,3);

	r = y + 1.402 * (Cr - 128);
	g = y - 0.34414 * (Cb - 128) - 0.71414 * (Cr - 128);
	b = y + 1.772 * (Cb - 128);
	rgb = cat(3, r, g, b);
end
