path = pwd;
path = strcat(path, '\images\');
im = imread(strcat(path, 'bones.tif'));
%im = rgb2gray(im);
subplot(2,4,1), imshow(im), title('Original Image');

%% laplace filter
f = fspecial('laplacian');
im1 = imfilter(im, f);
subplot(2,4,2), imshow(im1), title('Laplacian Filtered Image');

%% subtract new image form original image
im2 = im - im1;
subplot(2,4,3), imshow(im2), title('1-2 Image');

%% sobel filter
im3 = edge(im, 'Sobel');
im3 = im2uint8(im3);
im3 = im - im3;
% f1 = [-1 -2 -1; 0 0 0; 1 2 1];
% f2 = [-1 0 1; -2 0 2; -1 0 1];
% img1 = imfilter(im2, f1);
% img2 = imfilter(im2, f2);
% im3 = img1 + img2;
subplot(2,4,4), imshow(im3), title('Sobel Filtered Image');

%% 5x5 averaging filter for smoothening
f = fspecial('average', 5);
im4 = imfilter(im3, f);
subplot(2,4,5), imshow(im4), title('Average Filtered Image');

%% product of two images for mask
%im5 = immultiply(im2,im4);
im5 = imadd(im1, im4);
subplot(2,4,6), imshow(im5), title('Add 2-4');

%% sharpened image which is a sum of 2 images
im6 = im + im5;
subplot(2,4,7), imshow(im6), title('Sharpened Image');

%% power law transformation
im7 = double(im6)/255;
im7 = im7.^0.65;
subplot(2,4,8), imshow(im7), title('Final Optimized Image');