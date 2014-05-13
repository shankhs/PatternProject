clear;
clc;
initData = LoadData('training_set/train_x.txt');
classLabels = LoadClassLabels('training_set/train_y.txt');
initData = initData';

initFinalTestIntData = LoadData('testing_set_final_labeled/test_x_final_L.txt');
initFinalTestIntLabel = LoadClassLabels('testing_set_final_labeled/test_y_final_L.txt');
initFinalTestIntData = initFinalTestIntData';

initIntTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
initIntTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
initIntTestIntData = initIntTestIntData';

error=[];
minErr=100;
bestK=0;
bestDim=0;
bestStd=0;
DIM=53;
data = initData;
%             data = data(randperm(size(data,1)),:);
testData = initIntTestIntData;
%             testData = testData(randperm(size(testData,1)),:);
%         data = data*klm(data,dim);
%         testData = testData*klm(testData,dim);
A = prdataset(data,classLabels);
A = A*normm;
A = A*klm(A,DIM);
B = prdataset(testData,initIntTestIntLabel);
B = B*normm;
B = B*klm(B,DIM);
%         if dim>1
%             A = A*normm;
%             B = B*normm;
%         end

%             w = knnc(A,k);
%             classification = B*w;
%             [result,erredClass] = testc(classification);

w = ldc(A);

classification = B*w;

[result,erredClass] = testc(classification)

%[cm,ne,lab1,lab2]=confmat(classification);
confmat(classification);
% figure;
% B=[A];
% B = setname(B,'7-class Dataset');
% scatterd(B,'.');drawnow;
% plotc(w,'col');drawnow;
% hold on;
% scatterd(B,'legend');
% %scatterd(A,'legend');
% hold off;
% 
% disp(classification);