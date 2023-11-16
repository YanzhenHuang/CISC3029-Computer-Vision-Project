% CISC 3029 Project

originalImage = imread('machine.jpg');
imshow(originalImage);
title('Original Image');

% 构建高斯金字塔
gaussianPyramid = impyramid(originalImage, 'reduce');
figure;
subplot(2,2,1);
imshow(gaussianPyramid);
title('Gaussian Pyramid Level 1');

gaussianPyramid = impyramid(gaussianPyramid, 'reduce');
subplot(2,2,2);
imshow(gaussianPyramid);
title('Gaussian Pyramid Level 2');

gaussianPyramid = impyramid(gaussianPyramid, 'reduce');
subplot(2,2,3);
imshow(gaussianPyramid);
title('Gaussian Pyramid Level 3');

gaussianPyramid = impyramid(gaussianPyramid, 'reduce');
subplot(2,2,4);
imshow(gaussianPyramid);
title('Gaussian Pyramid Level 4');