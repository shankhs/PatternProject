% 51-st dim is optimal with klm
% 1st dim is optimal with fisherm
function [ error ] = RunPerlc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
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
       [result,std] = prcrossval(A,perlc,5,1)
        if result<minErr
            minErr=result
            bestDim=dim
        end
%          w = perlc(A);
% 
%         classification = B*w;
%         
%         [result,erredClass] = testc(classification)
% 
%         %[cm,ne,lab1,lab2]=confmat(classification);
%         confmat(classification)
% %         errorRate=[errorRate;result];
        error=[error;result];
    end
end