imagePath = "/MATLAB Drive/naruto.jpeg";
image = imread(imagePath);
imshow(image);
title('Image with Two Random Points');
[height, width, ~] = size(image);
randomPoint1 = randi([1, width], 1, 2);
randomPoint2 = randi([1, width], 1, 2);
hold on;
scatter(randomPoint1(1), randomPoint1(2), 50, 'r', 'filled');
scatter(randomPoint2(1), randomPoint2(2), 50, 'g', 'filled');
hold off;
euclideanDist = norm(randomPoint2 - randomPoint1);
manhattanDist = sum(abs(randomPoint2 - randomPoint1));
chebyshevDist = max(abs(randomPoint2 - randomPoint1));
minkowskiDist = norm(randomPoint2 - randomPoint1, 3);
cosineDist = 1 - dot(randomPoint1, randomPoint2) / (norm(randomPoint1) * norm(randomPoint2));
correlationDist = 1 - corr2(randomPoint1, randomPoint2);
hammingDist = sum(randomPoint1 ~= randomPoint2) / numel(randomPoint1);
fprintf('Random Point 1: (%d, %d)\n', randomPoint1(1), randomPoint1(2));
fprintf('Random Point 2: (%d, %d)\n', randomPoint2(1), randomPoint2(2));
fprintf('Euclidean Distance: %.2f\n', euclideanDist);
fprintf('Manhattan Distance: %.2f\n', manhattanDist);
fprintf('Chebyshev Distance: %.2f\n', chebyshevDist);
fprintf('Minkowski Distance: %.2f\n', minkowskiDist);
fprintf('Cosine Distance: %.2f\n', cosineDist);
fprintf('Correlation Distance: %.2f\n', correlationDist);
fprintf('Hamming Distance: %.2f\n', hammingDist);
