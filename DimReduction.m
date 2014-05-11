clear;
clc;

DIM=11;
initData = LoadData('training_set/train_x.txt');
classLabels = LoadClassLabels('training_set/train_y.txt');
initData = initData';
initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
initTestIntData = initTestIntData';

[r,c] = size(initData);
%N = prmemory(r*c*135);
errorRate=[];
p=2;

data = initData;

A = prdataset(data,classLabels); 
A = A*normm(2);
A = A*klm(A,DIM);

testIntData = initTestIntData;
testIntLabel = initTestIntLabel;

B = prdataset(testIntData,testIntLabel);
B = B*normm(2);
B = B*klm(B,DIM);
w = qdc(A);

classification = B*w;

[result,erredClass] = testc(classification);

%[cm,ne,lab1,lab2]=confmat(classification);
confmat(classification)
errorRate=[errorRate;result];
% if DIM<=2
figure
B=[A;B];
B = setname(B,'7-class Dataset');
scatterd(B,'.');drawnow;
plotc(w,'col');drawnow;
hold on;
scatterd(B,'legend');
%scatterd(A,'legend');
hold off;

%     disp(classification);
% end



