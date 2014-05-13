% KLM
% minErr =
% 
%     0.3078
% 
% 
% bestK =
% 
%      1
% 
% 
% bestDim =
% 
%      6
% 
% 
% bestStd =
% 
%    7.9999e-04

function [ error ] = RunKnnc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    minErr=100;
    bestK=0;
    bestDim=0;
    bestStd=0;
    for dim=1:MAX_DIM
        error_k=[];
        for k=1:3
            data = initData;
%             data = data(randperm(size(data,1)),:);
            testData = initTestIntData;
%             testData = testData(randperm(size(testData,1)),:);
    %         data = data*klm(data,dim);
    %         testData = testData*klm(testData,dim);
            A = prdataset(data,classLabels);
            A = A*normm;
            A = A*klm(A,dim);
            B = prdataset(testData,initTestIntLabel);
            B = B*normm;
            B = B*klm(B,dim);
    %         if dim>1
    %             A = A*normm;
    %             B = B*normm;
    %         end
            
%             w = knnc(A,k);
%             classification = B*w;
%             [result,erredClass] = testc(classification);
            [result,crossvalStd] = prcrossval(A,knnc([],k),5,5);
            if result<minErr
                minErr=result
                bestK=k
                bestDim=dim
                bestStd = crossvalStd
            end
%             w = knnc(A,k);
% 
%             classification = B*w;
% 
%             [result,erredClass] = testc(classification)
% 
%             %[cm,ne,lab1,lab2]=confmat(classification);
%             confmat(classification)
%     %         errorRate=[errorRate;result];
            error_k=[error_k;result];
        end
        error = [error error_k];
    end
end

