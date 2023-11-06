imagePath = '/MATLAB Drive/gojo.jpeg';
image = imread(imagePath);
imshow(image);
title('Image with two random points of same intensity');
% Get image dimensions
[height, width, ~] = size(image);
% Step 2: Find two random points with the same intensity
intensity = randi([0, 255]); % Random intensity value between 0 and 255
matchingPoints = find(image == intensity); % Find all points with the same intensity
numMatchingPoints = numel(matchingPoints);
% Check if there are enough matching points
if numMatchingPoints < 2
error('Not enough points with the same intensity.');
end
% Randomly select two points from the matching points
randIndices = randperm(numMatchingPoints, 2);
point1Index = matchingPoints(randIndices(1));
point2Index = matchingPoints(randIndices(2));
% Convert linear index to (y, x) coordinates
[point1Y, point1X] = ind2sub([height, width], point1Index);
[point2Y, point2X] = ind2sub([height, width], point2Index);
% Display the random points with the same intensity on the image
hold on;
scatter(point1X, point1Y, 50, 'r', 'filled');
scatter(point2X, point2Y, 50, 'g', 'filled');
hold off;
% Step 3: Calculate distances
euclideanDistance = norm([point2X, point2Y] - [point1X, point1Y]);
manhattanDistance = abs(point2X - point1X) + abs(point2Y - point1Y);
chebyshevDistance = max(abs(point2X - point1X), abs(point2Y - point1Y));
minkowskiDistance = norm([point2X, point2Y] - [point1X, point1Y], 3);
cosineDistance = 1 - dot([point1X, point1Y], [point2X, point2Y]) / ...
(norm([point1X, point1Y]) * norm([point2X, point2Y]));
correlationDistance = 1 - corr2([point1X, point1Y], [point2X, point2Y]);
hammingDistance = sum([point1X, point1Y] ~= [point2X, point2Y]) / 2;
fprintf('Point 1: (%d, %d), Intensity: %d\n', point1X, point1Y, intensity);
fprintf('Point 2: (%d, %d), Intensity: %d\n', point2X, point2Y, intensity);
fprintf('Euclidean Distance: %.2f\n', euclideanDistance);
fprintf('Manhattan Distance: %.2f\n', manhattanDistance);
fprintf('Chebyshev Distance: %.2f\n', chebyshevDistance);
fprintf('Minkowski Distance: %.2f\n', minkowskiDistance);
fprintf('Cosine Distance: %.2f\n', cosineDistance);
fprintf('Correlation Distance: %.2f\n', correlationDistance);
fprintf('Hamming Distance: %.2f\n', hammingDistance);
