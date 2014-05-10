function [ accuracy ] = RunGaussianSVM( initData,classLabels,initTestIntData,initTestIntLabel )
    error=[];
    for dim=1:54
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
        for g=1:50
            params = '-s 0 -t 2 -g ';
            params = [params,num2str(g)]
            model = svmtrain(classLabels,A.data,params);
            [predictedLabel,accuracy,decisionVals] = svmpredict(initTestIntLabel,B.data,model);
            error_k=[error_k;accuracy];
        end
        error = [error error_k];
    end
end

