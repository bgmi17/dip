I = imread('cat.jpg');
h = zeros(1,256);
% traversing the array of an image.
[r c] = size(I);
no_of_pixels = r*c;
n = 0 : 255; title('histogram plot without histeq() function');
% loop for travers
for i= 1:r
for j=1:c
h(I(i,j)+1) = h(I(i,j)+1)+1;
end
end
% Calculating Probability
for i=1:256
h(i)=h(i)/no_of_pixels;
end
% Calculating Cumulative Probability
temp=h(1);
for i=2:256
temp=temp+h(i);
h(i)=temp;
end
stem(n, h);
drawnow limitrate;
histogram(I);
