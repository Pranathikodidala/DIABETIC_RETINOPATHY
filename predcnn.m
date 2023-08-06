clc
%clear all
close all
matlabpath='C:\Users\Asus\Downloads\codes';
data=fullfile(matlabpath,'final images');
data=imageDatastore(data,'IncludeSubfolders',true,'LabelSource','foldernames');
[train]=splitEachLabel(data,4,'randomized');
count=train.countEachLabel;

net=alexnet;
layers=[imageInputLayer([448 336 1])
    net(2:end-3)
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer()
    ];

opt=trainingOptions('sgdm','MaxEpochs',10,'InitialLearnRate',0.0001);
trainednet=trainNetwork(train,layers,opt);

a=imread('Normal\H_H_H_image049.png');

out=classify(trainednet,a);
figure,imshow(a)
title(string(out))
msgbox(string(out))

[testData]=splitEachLabel(data,2);

allclass=[];
for ii=1:length(testData.Labels)
    I=readimage(testData,ii);
    class=classify(trainednet,I);

  allclass=[allclass class];

  figure(2),
  subplot(2,2,ii)
  imshow(I)
  title(char(class))
end

Predicted=allclass

figure,plotconfusion(testData.Labels,Predicted')