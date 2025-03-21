figure(1);
img = imread("images.jpg");
[width, height, ~] = size(img); 
subplot(1,3,1); 
imshow(img); 
title("Original Image"); 

gray_img = rgb2gray(img); 

A = zeros(width+2, height+2); 
for i = 1:1:width
    for j = 1:1:height 
        A(i+1, j+1) = gray_img(i, j);
    end     
end

w1 = [1 0 0 -1];
w2 = [0 1 -1 0];
for i = 2:1:width+1 
    for j = 2:1:height+1
        gx = w1(1)*A(i, j) + w1(2)*A(i, j+1) + w1(3)*A(i+1, j) + w1(4)*A(i+1, j+1);
        gy = w2(1)*A(i, j) + w2(2)*A(i, j+1) + w2(3)*A(i+1, j) + w2(4)*A(i+1, j+1);
        C(i, j) = sqrt(gx.^2 + gy.^2);
    end 
end

for i = 1:1:width
    for j = 1:1:height 
        B(i, j) = C(i+1, j+1); 
    end
end 

subplot(1,3,2); 
imshow(uint8(gray_img));
title("Grayscale Image");  

subplot(1,3,3); 
imshow(uint8(B)); 
title("Robert Image");