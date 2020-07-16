clear all; 
close all; 
clc;

the_image = imread('frame(e1)-1.png');
[width, height] = size(the_image);
image = imresize(the_image, 1);

% whos the_image
% 
% if width > 320
%     the_image = imresize(the_image, [320 NaN]);
% end

image_grayscale = rgb2gray(image);

whos image_grayscale

face_detector = vision.CascadeObjectDetector();

location_of_the_face = step(face_detector, image_grayscale);

detected_image = insertShape(image_grayscale, 'Rectangle', location_of_the_face);
figure(1);
imshow(detected_image);
title('Detected Face')

crop_image1 = imcrop(detected_image, location_of_the_face );
figure(2);
imshow(crop_image1);
title('Cropped Face');

size_crop_image = size(crop_image1)

%Eyes detection
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
% BB = step(EyeDetect, crop_image1);
location_of_the_eye = step(EyeDetect,image_grayscale );

detected_eye = insertShape(image_grayscale, 'Rectangle', location_of_the_eye);

figure(3);
imshow(detected_eye);
title('Detected Eyes');

crop_image2 = imcrop(detected_eye, location_of_the_eye );
figure(4);
imshow(crop_image2);
title('Cropped Eye');



% horizontalAverages = mean(I1, 2);
% plot(1:size(I1,1) , horizontalAverages)
% [Minimas Locs] = findpeaks(-horizontalAverages)
% hold on
% plot(locs, -1*Minimas, 'r*')
% if (locs(2)-locs(1)) < threshold
%    
% else





% %Eyes detection
% EyeDetect = vision.CascadeObjectDetector('EyePairSmall');
% 
% BBE = step(EyeDetect,crop_image1);
% 
% %Crop eyes
% 
% [x,y,z]= size(BBE)
% k = imcrop(crop_image1,BBE(x,:,:))
% 
% %Show eyes
% figure(3)
% imshow(k)

