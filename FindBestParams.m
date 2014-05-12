clear;
clc;
PARTITION=5;
REPEAT=5;
MAX_DIM=54;

initData = LoadData('training_set/train_x.txt');
classLabels = LoadClassLabels('training_set/train_y.txt');
initData = initData';
initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
initTestIntData = initTestIntData';

bestCs=[];
bestGammas=[];
percentCompletion=0;
randRows = randperm(size(initData,1));
dim=10;
for dim=1:6
    data = initData;
    data = data(randRows,:);
    data = prdataset(data,classLabels);
%     data = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
    data = data*normm(2);
%     data = (data'*normm(2))';
%     if dim>0
    data = data*fisherm(data,dim);
%     end
%     data = prdataset(data,classLabels);
%     data = data*normm(2);
    data = data.data;
    mean(data)
    size(data)
%     data = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
    
%     A = prdataset(initData,classLabels);
%     if dim>1
%         A = A*normm;
%     end
    nFolds = 5;
%     c = [-5:2:15];
    c=[2];
    perfMat = zeros(numel(c),1);
    for i=1:numel(c)
%         fprintf('Running svm for dim = %f, c = %f and gamma = %f\n',dim,2^c(i),2^gamma(i));
        perfMat(i)=svmtrain(classLabels,data,sprintf('-q -t 0 -v %f -c %f ',nFolds,2^c(i)));
        completion = (percentCompletion+1)*100/(20*numel(c))
        percentCompletion=percentCompletion+1;
    end
    [maxVal,idx] = max(perfMat)
    bestCs=[bestCs;2^c(idx)];
%     bestGammas=[bestGammas;2^gamma(idx)];
    dlmwrite('bestCs_t0.txt',bestCs);
%     dlmwrite('bestGammas_t0.txt',bestGammas);
    
end

%     bestcv = 0;
%     for log2
%         c = -1:3,
%       for log2g = -4:1,
%         cmd = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
%         cv = svmtrain(classLabels, data, cmd);
%         if (cv >= bestcv),
%           bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
%         end
%         fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
%       end
%     end
% end