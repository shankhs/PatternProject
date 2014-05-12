% KLM
% minErr =
% 
%     0.4603
% 
% 
% bestDim =
% 
%     42
% FISHERM
% minErr =
% 
%     0.4548
% 
% 
% bestDim =
% 
%      1

function [ error ] = RunLdc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    minErr=100;
    bestDim=0;
    for dim=1:MAX_DIM
        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
        A = A*normm;
        A = A*klm(A,dim);
        
        B = prdataset(testData,initTestIntLabel);
        B = B*normm;
        B = B*klm(B,dim);

        w = ldc(A);
        classification = B*w;
        [result,erredClass] = testc(classification);
        if result<minErr
            minErr=result
            bestDim=dim
        end
        error=[error;result];
    end
end

