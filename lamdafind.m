function [lamdaplus,lamdaminus]=lamdafind(gaa1,gbb1,gab1) %This function
%is used to find eigen values of hessian matrix and output %maximum and
%minimum eigen value as lamdaplus and lambaminus
H=[gaa1 gab1;gab1 gbb1];
%Obtain eigen values
lamda=eig(H);
%Obtain maximum and minimum lamda values
if lamda(1)>lamda(2)
 lamdaplus = lamda(1);
 lamdaminus = lamda(2);
else if lamda(1)<lamda(2)
 lamdaplus = lamda(2);
 lamdaminus = lamda(1);
 else
  lamdaplus = lamda(1);
  lamdaminus = lamda(2);
 end
end
end