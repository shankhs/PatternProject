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

unlTestData = LoadData('testing_set_unlabeled/test_x_U.txt');
unlTestData = unlTestData';
size(unlTestData)
unlTestLabel = repmat(1,size(unlTestData,1),1);
size(unlTestLabel)

initData = [initData;initFinalTestIntData;initIntTestIntData];
classLabels = [classLabels;initFinalTestIntLabel;initIntTestIntLabel];

error=[];
minErr=100;
bestK=0;
bestDim=0;
bestStd=0;
DIM=2;
data = initData;
%             data = data(randperm(size(data,1)),:);
testData = unlTestData;
%             testData = testData(randperm(size(testData,1)),:);
%         data = data*klm(data,dim);
%         testData = testData*klm(testData,dim);
A = prdataset(data,classLabels);
A = A*normm;
% A = A*klm(A,DIM);
B = prdataset(testData,unlTestLabel);
B = B*normm;
% B = B*klm(B,DIM);
params = '-q -s 0 -t 2 -c 8192 -g 16';
model = svmtrain(classLabels,A.data,params);
[predictedLabel,accuracy,decisionVals] = svmpredict(unlTestLabel,B.data,model);
% [confusionMatrix,order] = confusionmat(unlTestLabel,predictedLabel)
accuracy
% pos = find(predictedLabel==1);
% hold on;
% redcolor = [1 0.8 0.8];
% bluecolor = [1 1 1];
% h1 = plot(dd(pos,1),dd(pos,2),'s','color',redcolor,'MarkerSize',10,'MarkerEdgeColor',redcolor,'MarkerFaceColor',redcolor);
% pos = find(predicted_label==-1);
% hold on;
% h2 = plot(dd(pos,1),dd(pos,2),'s','color',bluecolor,'MarkerSize',10,'MarkerEdgeColor',bluecolor,'MarkerFaceColor',bluecolor);
% uistack(h1, 'bottom');
% uistack(h2, 'bottom');
% figure;
% B=[A];
% B = setname(B,'7-class Dataset');
% scatterd(B,'.');drawnow;
% % plotc(w,'col');drawnow;
% hold on;
% scatterd(B,'legend');
% %scatterd(A,'legend');
% hold off;