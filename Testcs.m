clear;
clc;    
initData = LoadData('training_set/train_x.txt');
classLabels = LoadClassLabels('training_set/train_y.txt');
initData = initData';
initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
initTestIntData = initTestIntData';
error=[];
minErr=100;
bestK=0;
bestDim=0;
for dim=10:2:20 
    error_k=[];
    for k=1:20
        data = initData;
%             data = data(randperm(size(data,1)),:);
        testData = initTestIntData;
%             testData = testData(randperm(size(testData,1)),:);
%         data = data*klm(data,dim);
%         testData = testData*klm(testData,dim);
        A = prdataset(data,classLabels);
        A = (A*normm);
        A = A*klm(A,dim);
        B = prdataset(testData,initTestIntLabel);
        B = (B*normm);
        B = B*klm(B,dim);
%         if dim>1
%             A = A*normm;
%             B = B*normm;
%         end
%         error_k=[];
        w = knnc(A,k);
        classification = B*w;
        [result,erredClass] = testc(classification);
        if result<minErr
            minErr=result
%                 bestK=k
            bestDim=dim
        end
        error_k=[error_k;result];
    end
    error = [error error_k];
end


