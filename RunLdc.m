function [ error ] = RunLdc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    for dim=2:MAX_DIM
        data = initData;
        testData = initTestIntData;
        data = data*klm(data,dim);
        testData = testData*klm(testData,dim);
        A = prdataset(data,classLabels);
%         A = A*klm(A,dim);
        A = A*normm;
        
        B = prdataset(testData,initTestIntLabel);  
%         B = B*klm(B,dim);
        B = B*normm;
        
%         if dim>1
%             A = A*normm;
%             B = B*normm;
%         end
        
        w = ldc(A);
        classification = B*w;
        [result,erredClass] = testc(classification);
        error=[error;result];
    end
end

