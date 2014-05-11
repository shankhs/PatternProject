function [ error ] = RunLdc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    for dim=1:MAX_DIM
        data = initData;
        testData = initTestIntData;
        data = data*klm(data,dim);
        testData = testData*klm(testData,dim);
        A = prdataset(data,classLabels);
        B = prdataset(testData,initTestIntLabel);        
        if dim>1
            A = A*normm;
            B = B*normm;
        end
        
        w = ldc(A);
        classification = B*w;
        [result,erredClass] = testc(classification);
        error=[error;result];
    end
end

