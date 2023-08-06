

function [segImage] = vesselSegPC(inputImage)
%Generation of image mask
mask = imbinarize(inputImage,20/255);
se = strel('octagon',24);
erodedmask = im2uint8(imerode(mask,se));
%Apply gaussian filter to the image where s=1.45
img3= imgaussfilt(inputImage(:,:,2) ,1.45);
%Finding lamda - principal curvature
lamda2=prinCur(img3);
maxprincv = im2uint8(lamda2/max(lamda2(:)));
maxprincvmsk = maxprincv.*(erodedmask/255);
%Contrast enhancement.
newprI =adapthisteq(rgb2gray(maxprincvmsk)); 
thresh =isodata(newprI);
vessels = imbinarize(newprI,thresh);
%Filtering out small segments
vessels = bwareaopen(vessels, 1500);
segImage = vessels;