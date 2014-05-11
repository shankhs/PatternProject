function [ error ] = RunKnnc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
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
        error_k=[];
        for k=1:15
            w = knnc(A,k);
            classification = B*w;
            [result,erredClass] = testc(classification);
            error_k=[error_k;result];
        end
        error = [error error_k];
    end
end

