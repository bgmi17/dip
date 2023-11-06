originalImage = imread('img/img3.jpg');
grayImage = rgb2gray(originalImage);
thresholdValue = 128;
binaryImage = grayImage > thresholdValue;
imshow(binaryImage);
connectedComponents = bwconncomp(binaryImage, 4);
numPaths = connectedComponents.NumObjects;
fprintf('Number of 4-paths: %d\n', numPaths);
Number of 4-paths: 313
hold on;
for i = 1:numPaths
% Get the indices of the current path pixels
currentPathIndices = connectedComponents.PixelIdxList{i};
% Convert 1D indices to 2D (row, column) indices
[rowIndices, colIndices] = ind2sub(size(binaryImage), currentPathIndices);
% Plot the current path
plot(colIndices, rowIndices, 'r', 'LineWidth', 2); % Assuming red color for
visualization
end
hold off;
title('Binary Image with 4-paths highlighted')
connectedComponents8 = bwconncomp(binaryImage, 8);
numPaths8 = connectedComponents8.NumObjects;
fprintf('Number of 8-paths: %d\n', numPaths8);
Number of 8-paths: 250
hold on;
for i = 1:numPaths8
% Get the indices of the current path pixels
currentPathIndices8 = connectedComponents8.PixelIdxList{i};
% Convert 1D indices to 2D (row, column) indices
[rowIndices8, colIndices8] = ind2sub(size(binaryImage), currentPathIndices8);
% Plot the current path
plot(colIndices8, rowIndices8, 'g', 'LineWidth', 2); % Assuming green color for
visualization
end
hold off;

title('Binary Image with 8-paths highlighted');
boundaries = bwboundaries(binaryImage);
hold on;
for i = 1:numel(boundaries)
currentBoundary = boundaries{i};
plot(currentBoundary(:, 2), currentBoundary(:, 1), 'y', 'LineWidth', 2); % Assuming
yellow color for visualization
end
hold off;
