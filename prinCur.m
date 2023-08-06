function lamda2=prinCur(Image)
%Image : Input Image
%Here we obtain parameters for Hessian metrx in every pixel and find eigen %valuesof the hessian matrix using lamdafind function
% Obtain parameters for hessian matrix
[ga, gb] = gradient(double(Image));
[gaa, ~] = gradient(ga);
[gab, gbb] = gradient(gb);
[row,col]=size(Image);
lamdaplus = zeros(row,col);
lamdaminus = zeros(row,col);
%finding eigen values of hessian matrix [gaa gab;gab gbb]
for r = 1:row
for c = 1:col
[lamdaplus(r,c),lamdaminus(r,c)]=lamdafind(gaa(r,c),gbb(r,c),gab(r,c)); end
end
lamda2 = lamdaplus;
end