% Read the image
I = rgb2gray(imread('cat.jpg'));
% originalImage=imresize(originalImage,[720 720],'bicubic');
figure
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imhist(I,64)
J = adapthisteq(I);
figure
subplot(1,2,1)
imshow(J)
subplot(1,2,2)
imhist(J,64)
