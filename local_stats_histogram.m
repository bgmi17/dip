% Read the image
originalImage = rgb2gray(imread('cat.jpg'));
% Specify the size of the local region (e.g., 64x64 pixels)
windowSize = [64, 64];
% Apply local histogram equalization
equalizedImage = adapthisteq(originalImage, 'NumTiles', floor(size(originalImage) ./ windowSize));
% Display the original and equalized images
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 2, 2);
imshow(equalizedImage);
title('Local Histogram Equalized Image')