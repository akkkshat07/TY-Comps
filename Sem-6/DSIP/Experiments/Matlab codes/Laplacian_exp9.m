figure(4);
img = imread("images.jpg");
[width, height, dim] = size(img); 

if dim == 3
    gray_img = rgb2gray(img); 
else
    gray_img = img;
end

A = zeros(width+2, height+2); 
for i = 1:1:width
    for j = 1:1:height
        A(i+1, j+1) = gray_img(i, j);
    end
end

w1 = [0 1 0 1 -4 1 0 1 0];
for i = 2:1:width+1 
    for j = 2:1:height+1
        gx = w1(1)*A(i-1,j-1) + w1(2)*A(i-1,j) + w1(3)*A(i-1,j+1) + w1(4)*A(i,j-1) + w1(5)*A(i,j) + w1(6)*A(i,j+1) + w1(7)*A(i+1,j-1) + w1(8)*A(i+1,j) + w1(9)*A(i+1,j+1);
        C(i,j) = gx;
    end 
end

for i = 1:1:width 
    for j = 1:1:height
        B(i,j) = C(i+1,j+1);
    end 
end

subplot(1,2,1); 
imshow(gray_img);
title("Grayscale Image"); 

subplot(1,2,2); 
imshow(uint8(B)); 
title("Laplace Image");
