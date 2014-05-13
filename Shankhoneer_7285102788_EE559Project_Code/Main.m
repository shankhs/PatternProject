clear;
clc;
% Environment vars
PARTITION=5;
REPEAT=5;
MAX_DIM=54;

% Load training data
initData = LoadData('../training_set/train_x.txt');
classLabels = LoadClassLabels('../training_set/train_y.txt');
initData = initData';

% Load testing data
initTestIntData = LoadData('../testing_set_int_labeled/test_x_int_L.txt');
initTestIntLabel = LoadClassLabels('../testing_set_int_labeled/test_y_int_L.txt');
initTestIntData = initTestIntData';

% Perform experiments to measure baseline performance 
[errorRate,crossvalErrorRate,crossvalStd]=Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,0)
[normErrorRate,normBaselineErrorRate,normBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,0)
[reduceDimErrorRate,reduceDimBaselineErrorRate,reduceDimBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,1)
[reduceDimNormErrorRate,reduceDimNormBaselineErrorRate,reduceDimNormBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,1)
% baselineErrorRate
% normBaselineErrorRate
% reduceDimErrorRate
% normBaselineErrorRate

dlmwrite('errorRate.txt',errorRate);
dlmwrite('normErrorRate.txt',normErrorRate);
dlmwrite('reduceDimErrorRate.txt',reduceDimErrorRate);
dlmwrite('reduceDimNormErrorRate.txt',reduceDimNormErrorRate)
DrawPlot(reduceDimNormErrorRate,'reduceDimNormErrorRate');
DrawPlot(reduceDimErrorRate,'reduceDimErrorRate');

%run svm
% fprintf('Now running svm\n')
% linearSvmErrorRate = RunLinearSVM(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
% gaussianSvmErrorRate = RunGaussianSVM(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
%run knn
% -----------------------------------------------------------------------------------------------
% fprintf('Now running knn\t')
% knnErrorRate = RunKnnc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
% dlmwrite('knnErrorRate.txt',knnErrorRate);
% DrawPlot(knnErrorRate,'knnErrorPlot');
% -----------------------------------------------------------------------------------------------
%run ldc
% -----------------------------------------------------------------------------------------------
% fprintf('Now running ldc')
% ldcErrorRate = RunLdc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
% dlmwrite('ldcErrorRate.txt',ldcErrorRate);
% DrawPlot(ldcErrorRate,'ldcErrorPlot');
% -----------------------------------------------------------------------------------------------
%run perlc
% fprintf('Now running perlc')
% [perlErrorRate] = RunPerlc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
% dlmwrite('perlErrorRate.txt',perlErrorRate);
% DrawPlot(perlErrorRate,'perlErrorRate');
% -----------------------------------------------------------------------------------------------

% diary off,;