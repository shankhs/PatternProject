% Fisherm 1st dim
function [error] = RunAnnc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM)
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
        for UNITS=6:10
            w = bpxnc(A,UNITS);
            classification = B*w;
            [result,erredClass] = testc(classification);
            if result<minErr
                minErr=result
                bestDim=dim
            end
            error=[error;result];
        end
    end
end