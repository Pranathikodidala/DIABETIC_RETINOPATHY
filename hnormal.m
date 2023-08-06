srcFile = dir('C:\Users\Asus\Downloads\codes\N\*.png');
mkdir('HNormal');
for i=1:length(srcFile)
    filename = strcat('C:\Users\Asus\Downloads\codes\N\',srcFile(i).name);
    Test_Image = imread(filename);
    segIm = vesselpc(Test_Image);
    path = strcat('C:\Users\Asus\Downloads\codes\final_images\HNormal\',srcFile(i).name);
    imwrite(segIm,path);
end
