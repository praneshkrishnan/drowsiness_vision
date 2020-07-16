clear all, close all, clc
Vptr = VideoReader('4-1.mp4')
Vptr

%Num_Frames = Vptr.NumberOfFrames;
NFrames = round(Vptr.FrameRate*Vptr.Duration);

%Find the height and weight of the frame
Nrows = Vptr.height;
Ncols = Vptr.width;

%Preallocate the matrix
Img_s = zeros([Nrows,Ncols,NFrames]);

for i = 1: NFrames
%Read each frame
Img = readFrame(Vptr);

%To display all the frames
figure,imshow(Img);

%To save the images
Img_name=['Image',num2str(i),'.jpg'];
imwrite(Img,Img_name);

%To store in MAT file
Img_s(:,:,i)=Img;
end

 %Save the matrix as .mat file
Save Video_Images.mat Img_s;