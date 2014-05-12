clear;
clc;
PARTITION=5;
REPEAT=5;
MAX_DIM=54;
diary('diary.txt');
diary on;
initData = LoadData('training_set/train_x.txt');
classLabels = LoadClassLabels('training_set/train_y.txt');
initData = initData';
initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
initTestIntData = initTestIntData';
% [errorRate,crossvalErrorRate,crossvalStd]=Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,0)
% [normErrorRate,normBaselineErrorRate,normBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,0)
% [reduceDimErrorRate,reduceDimBaselineErrorRate,reduceDimBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,1)
% [reduceDimNormErrorRate,reduceDimNormBaselineErrorRate,reduceDimNormBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,1)
% baselineErrorRate
% normBaselineErrorRate
% reduceDimErrorRate
% normBaselineErrorRate
% dlmwrite('errorRate.txt',errorRate);
% dlmwrite('normErrorRate.txt',normErrorRate);
% dlmwrite('reduceDimErrorRate.txt',reduceDimErrorRate);
% dlmwrite('reduceDimNormErrorRate.txt',reduceDimNormErrorRate)
% DrawPlot(reduceDimNormErrorRate,'reduceDimNormErrorRate');
% DrawPlot(reduceDimErrorRate,'reduceDimErrorRate');

%run svm
% fprintf('Now running svm')
% linearSvmErrorRate = RunLinearSVM(initData,classLabels,initTestIntData,initTestIntLabel);
% gaussianSvmErrorRate = RunGaussianSVM(initData,classLabels,initTestIntData,initTestIntLabel);
%run knn
% -----------------------------------------------------------------------------------------------
fprintf('Now running knn\t')
knnErrorRate = RunKnnc(initData,classLabels,initTestIntData,initTestIntLabel,6);
dlmwrite('knnErrorRate.txt',knnErrorRate);
DrawPlot(knnErrorRate,'knnErrorPlot');
% -----------------------------------------------------------------------------------------------
%run ldc
% -----------------------------------------------------------------------------------------------
% fprintf('Now running ldc')
% ldcErrorRate = RunLdc(initData,classLabels,initTestIntData,initTestIntLabel,30);
% dlmwrite('ldcErrorRate.txt',ldcErrorRate);
% DrawPlot(ldcErrorRate,'ldcErrorPlot');
% -----------------------------------------------------------------------------------------------
%run parzen
%[pzErrorRate] = Runc(MAX_DIM,parzenc,1,1,0)
%DrawPlot(pzErrorRate);
diary off,;