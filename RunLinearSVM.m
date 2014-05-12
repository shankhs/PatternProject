function [ accuracy ] = RunLinearSVM( initData,classLabels,initTestIntData,initTestIntLabel )
    accr=0;
    bestDim=0;
    error=[];

    for dim=1:6

        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
        B = prdataset(testData,initTestIntLabel);
        A = A*normm;
%         A = A*normm;
        
        B = B*normm;
%         if dim<54
%             A = A*klm(A,dim);
%             B = B*klm(B,dim);
%         end
%         B = B*normm;
        A = A*fisherm(A,dim)
        B = B*fisherm(B,dim)
        error_k=[];

        for c=1:15
            params = '-q -s 0 -t 0 -c ';
            params = [params,num2str(2^c)]
            model = svmtrain(classLabels,A.data,params);
            [predictedLabel,accuracy,decisionVals] = svmpredict(initTestIntLabel,B.data,model);
            error_k=[error_k;accuracy(1)];
            if accuracy(1)>accr
                accr = accuracy(1)
%                 bestDim = dim
            end
        end
        error = [error error_k];
        dlmwrite('linearSvmError.txt',error);

    end
end

