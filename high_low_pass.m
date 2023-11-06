% Load the input image
inputImage = imread('cat.jpg'); % Replace 'input_image.jpg' with your image file
% Display the original image
figure;
subplot(2, 2, 1);
imshow(inputImage);
title('Original Image');
% Define the 3x3 low-pass filter (averaging filter)
lowPassFilter = ones(3, 3) / 9; % Normalized filter
% Apply the low-pass filter to the image
filteredImageLowPass = imfilter(inputImage, lowPassFilter);
% Display the low-pass filtered image
subplot(2, 2, 2);
imshow(filteredImageLowPass);
title('Low-Pass Filtered Image');
% Define the 3x3 high-pass filter (Laplacian filter)
highPassFilter = [0 -1 0; -1 4 -1; 0 -1 0];
% Apply the high-pass filter to the image
filteredImageHighPass = imfilter(inputImage, highPassFilter);
% Display the high-pass filtered image
subplot(2, 2, 3);
imshow(filteredImageHighPass, []);
title('High-Pass Filtered Image');
% Add the high-pass filtered image back to the original image to emphasize edges
enhancedImage = inputImage + filteredImageHighPass;
% Display the enhanced image
subplot(2, 2, 4);
imshow(enhancedImage);
title('Enhanced Image (Original + High-Pass)');
