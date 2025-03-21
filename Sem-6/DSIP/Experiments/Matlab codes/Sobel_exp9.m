
inputImage = imread('images.jpg');

grayImage = rgb2gray(inputImage);

sobelX = [-1 0 1; -2 0 2; -1 0 1]; 
sobelXGradient = conv2(double(grayImage), sobelX, 'same');


sobelY = [-1 -2 -1; 0 0 0; 1 2 1];
sobelYGradient = conv2(double(grayImage), sobelY, 'same');


edgeMagnitude = sqrt(sobelXGradient.^2 + sobelYGradient.^2);

figure;
subplot(2, 2, 1);
imshow(grayImage);
title('Grayscale Image');

subplot(2, 2, 2);
imshow(uint8(abs(sobelXGradient)), []);
title('Sobel X Gradient');

subplot(2, 2, 3);
imshow(uint8(abs(sobelYGradient)), []);
title('Sobel Y Gradient');

subplot(2, 2, 4);
imshow(uint8(edgeMagnitude), []);
title('Sobel Edge Detection');

