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

% Calculate the BRISK features from the frame
% points = detectBRISKFeatures(I)
% points1 = detectKAZEFeatures(rgb2gray(Img))
% points2 = detectHarrisFeatures(rgb2gray(Img), 'MinQuality', 0.05);
%   
% % Plot the points on the image
% figure(1)
% imshow(I); hold on;
% plot(points.selectUniform(5));
% 
% figure(2)
% imshow(Img)
% hold on
% plot(points1)
% hold off
% title('Original Points')


% figure(3)
% numPoints = 100;
% points2 = selectUniform(points1,numPoints,size(Img));
% imshow(Img);
% hold on
% plot(points2);
% hold off
% title('Uniformly distributed points');



%face detection
FDetect = vision.CascadeObjectDetector;

imshow(I)
hold on
x = step(FDetect,I);

for i = 1:size(x,1)
    rectangle('Position', x(1,:), 'LineWidth',5, 'LineStyle','-','EdgeColor','r');
end

% Crop image
j = imcrop(I,x)

% New figure
figure(4)
imshow(j)

%Eyes detection
EyeDetect = vision.CascadeObjectDetector('EyePairBig');

BBE = step(EyeDetect,j);

%Crop eyes

[x,y,z]= size(BBE)
k = imcrop(j,BBE(x,:,:))

%Show eyes
figure
imshow(k)



%To store in MAT file
% Img_s(:,:,i)=Img;
end


