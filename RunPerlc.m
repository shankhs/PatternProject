% 51-st dim is optimal with klm
% 1st dim is optimal with fisherm
function [ error ] = RunPerlc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    minErr=100;
    bestDim=0;
    for dim=51:51
        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
        A = A*normm;
        A = A*klm(A,dim);
        B = prdataset(testData,initTestIntLabel);
        B = B*normm;
        B = B*klm(B,dim);
        w = perlc(A,1000);
        classification = B*w;
        [result,erredClass] = testc(classification);
        if result<minErr
            minErr=result
            bestDim=dim
        end
        error=[error;result];
    end
end