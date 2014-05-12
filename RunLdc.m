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

%         w = ldc(A);
%         classification = B*w;
%         [result,erredClass] = testc(classification);
        [result,std] = prcrossval(A,ldc,5,5)
        if result<minErr
            minErr=result
            bestDim=dim
        end
         w = ldc(A);

        classification = B*w;
        
        [result,erredClass] = testc(classification);

        %[cm,ne,lab1,lab2]=confmat(classification);
        confmat(classification)
%         errorRate=[errorRate;result];
        error=[error;result];
    end
end

