clear;
% x=[2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1];
% x=x';
% y=[2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];
% y=y';
z = LoadTrainData('training_set/train_x.txt');
z=z';
[eigenVecs, score, eigenVals] = pca(z);
sz = size(z);
col = sz(2);
row=sz(1);
m=mean(z);
for i=1:row
    z(i,1)=z(i,1)-m(1,1);
    z(i,2)=z(i,2)-m(1,2);
end


[eigenVecsNorm,eigenValsNorm] = eig(cov(z));