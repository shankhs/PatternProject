function [ accuracy ] = RunLinearSVM( initData,classLabels,initTestIntData,initTestIntLabel )
    error=[];
    for dim=10:20
        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
        B = prdataset(testData,initTestIntLabel);
        A = A*normm;
        A = A*klm(A,dim);
        
        B = B*normm;
        B = B*klm(B,dim);
        error_k=[];
        for c=1:5
            params = '-s 0 -t 0 -c ';
            params = [params,num2str(c)]
            model = svmtrain(classLabels,A.data,params);
            [predictedLabel,accuracy,decisionVals] = svmpredict(initTestIntLabel,B.data,model);
            error_k=[error_k;accuracy];
        end
        error = [error error_k];
    end
end

