m = imread('smiley.png');
m = rgb2gray(m);
m = m < 200;
m = imresize(m, [128, 128]);
m = padarray(m, [192,192], 0, 'both');
imshow(m,[]);
imwrite(m, 'smiley.tif','tif');