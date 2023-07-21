%clear variables
clc, clear , close all;

folder = 'Example_Folder';
dataset=dir([folder '/*.txt'])

for i = 1:length(dataset)
    disp ([dataset(i).name '      ' dataset(i).date])
end

clc
[~,idx] = sort([dataset.datenum]);
dataset = dataset(idx);
for i = 1:length(dataset)
    disp ([dataset(i).name '      ' dataset(i).date])
end


image = imread('Example_picture.png');
disp(['Dimensionen: ' num2str(size(image))])
disp(['Klasse: ' class(image)])


subplot(2,2,1)
imshow(image)
title('Original')
subplot(2,2,2)
imshow(image(:,:,1)); colorbar
title('Red component')
subplot(2,2,3)
imshow(image(:,:,2)); colorbar
title('Green component')
subplot(2,2,4)
imshow(image(:,:,3)); colorbar
title('Blue component')


close all;

subplot(1,2,1)
imagesc(image);

[X,Y]=ginput(2);  %Dialog is not displayed in Jupyter
X = round(X);  %Round to full pixels
Y = round(Y); 
trim = image(min(Y):max(Y),min(X):max(X),:);

subplot(1,2,2)
imshow(trim)

close all;

threshold = 0;
red = image(:,:,1) > threshold;
green = image(:,:,2) > threshold;
blue = image(:,:,3) > threshold;
disp(['Dimensions: ' num2str(size(red))])
disp(['Class: ' class(red)])


area = red&not(green);
imshow(area)

close all;

threshold = 254;
red = image(:,:,1) > threshold;
green = image(:,:,2) > threshold;
blue = image(:,:,3) > threshold;

star = blue;
imshow(star)

close all;

subplot(2,3,1)
imshow(image)
title('Original')
subplot(2,3,2)
imshow(rgb2hsv(image))
title('hsv color scale')
subplot(2,3,3)
imshow(rgb2ycbcr(image))
title('ycbcr color scale')
subplot(2,3,4)
imshow(rgb2ntsc(image))
title('ntsc color scale')
subplot(2,3,5)
imshow(rgb2gray(image))
title('Grayscale')
subplot(2,3,6)
imshow(im2bw(image))
title('Black and white')


close all;

image_hsv = rgb2hsv(image);

subplot(2,2,1)
imshow(image_hsv)
title('Original')
subplot(2,2,2)
imshow(image_hsv(:,:,1))
title('Color value')
subplot(2,2,3)
imshow(image_hsv(:,:,2))
title('Color saturation')
subplot(2,2,4)
imshow(image_hsv(:,:,3))
title('Brightness')


close all;

[B,L] = bwboundaries(star,'noholes');


properties = regionprops('table',L,'Centroid','Area','Orientation');

disp(['Center coordinates: ' num2str(properties.Centroid)])
disp(['Area:                  ' num2str(properties.Area)])
disp(['Angle of the principal axis:   ' num2str(properties.Orientation)])