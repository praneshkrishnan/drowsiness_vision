%File to read the video file in MP4 format and process the video into
%images


clear all, close all, clc
Vptr = VideoReader('6-2.mp4')
Vptr

%Num_Frames = Vptr.NumberOfFrames;
NFrames = round(Vptr.FrameRate*Vptr.Duration);

%Find the height and weight of the frame
Nrows = Vptr.height;
Ncols = Vptr.width;

% Img_s = zeros([Nrows,Ncols,NFrames]);

for i = 1: 1 %Nframes
%Read each frame
Img = readFrame(Vptr);

%To display all the frames
figure,imshow(Img);

%To save the images
Img_name=['Image',num2str(i),'.jpg'];
imwrite(Img,Img_name);

%convert the image from RGB to gray
I = rgb2gray(Img)


%% Face detection

faceDetector = vision.CascadeObjectDetector;

I = imread('Image1.jpg');

bboxes = faceDetector(I);

IFaces = insertObjectAnnotation(I,'rectangle',bboxes,'Face');   
figure
imshow(IFaces)
title('Detected faces');

%% Upper Body Detection

bodyDetector = vision.CascadeObjectDetector('UpperBody'); 
bodyDetector.MinSize = [60 60];
bodyDetector.MergeThreshold = 10;

I2 = imread('Image1.jpg');
bboxBody = bodyDetector(I2);

% Annotate detected upper bodies.

IBody = insertObjectAnnotation(I2,'rectangle',bboxBody,'Upper Body');
figure
imshow(IBody)
title('Detected upper bodies');


%% Eye detection
Ix = imread('Image1.jpg');
I = rgb2gray(Ix);


%Eyes detection
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
% BB = step(EyeDetect, crop_image1);
location_of_the_eye = step(EyeDetect,I);

detected_eye = insertShape(I, 'Rectangle', location_of_the_eye);

figure(3);
imshow(detected_eye);
title('Detected Eyes');

crop_image2 = imcrop(detected_eye, location_of_the_eye );
figure(4);
imshow(crop_image2);
title('Cropped Eye');




% eyeDetector = vision.CascadeObjectDetector('EyePairBig');
% eyeDetector.MinSize = [11 45];
% eyeDetector.MergeThreshold = 10;
% 
% BB=step(eyeDetector,I);
% 
% % Annotate detected Eyes.
% 
% IEye = insertObjectAnnotation(I2,'rectangle',BB,'Eyes');
% figure
% imshow(IEye)
% title('Detected Eyes');


%Eyes detection
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
% BB = step(EyeDetect, crop_image1);
location_of_the_eye = step(EyeDetect,image_grayscale );

detected_eye = insertShape(image_grayscale, 'Rectangle', location_of_the_eye);

figure(3);
imshow(detected_eye);
title('Detected Eyes');





% x = length(BB(:,4));

% % To detect eyes
% I2I = imcrop(I,BB(x,:));
%     figure,imshow(I2I);
%    rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
%   %To detect the left 
%   na1 = I2(:, 1 : floor(end/2.3));
%   figure,imshow(na1);
%   %To detect the right
%   na2 = I2(:, floor(end/(2.24))+1 : end );
%   figure,imshow(na2);




%% Eye
a =imread('Image1.jpg');
a = imresize(a,0.5);
imshow(a);
detector = vision.CascadeObjectDetector('EyePairBig');

bbox = step(detector,a);
out = insertObjectAnnotation(a,'rectangle',bbox, 'detection');
imshow(out)