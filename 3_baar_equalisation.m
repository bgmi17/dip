% Read the image
originalImage = imread('cat.jpg');
% Number of times to apply histogram equalization
numIterations = 3;
% Apply histogram equalization multiple times
for i = 1:numIterations
equalizedImage = histeq(originalImage);
% Display the original and equalized images
subplot(2, numIterations, i);
imshow(originalImage);
title(['Original Image (Iteration ' num2str(i) ')']);
subplot(2, numIterations, i + numIterations);
imshow(equalizedImage);
title(['Equalized Image (Iteration ' num2str(i) ')']);
% Update the original image for the next iteration
originalImage = equalizedImage;
end
% Display the final equalized image
figure;
imshow(equalizedImage);
title('Final Equalized Image');
% Show histograms of the original and final equalized images
figure;
subplot(2, 1, 1);
imhist(originalImage);
title('Histogram of Original Image');
subplot(2, 1, 2);
imhist(equalizedImage);
title('Histogram of Final Equalized Image'