function [ accuracy ] = RunGaussianSVM( initData,classLabels,initTestIntData,initTestIntLabel )
    accr=0;
    bestDim=0;
    error=[];

%     for dim=1:6

        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
        B = prdataset(testData,initTestIntLabel);
        A = A*normm;
%         A = A*fisherm(A,dim);
%         A = A*normm;
        
        B = B*normm;
%         B = B*fisherm(B,dim);
%         B = B*normm;
        
        error_k=[];

        for c=1:15
            for g = 1:10
                params = '-q -s 0 -t 2 -c ';
                params = [params,num2str(2^c)];
                params = [params,' -g '];
                params = [params,num2str(g)]
                model = svmtrain(classLabels,A.data,params);
                [predictedLabel,accuracy,decisionVals] = svmpredict(initTestIntLabel,B.data,model);
                accuracy(1)
                dlmwrite('gaussianSvmError.txt',accuracy,'-append');
                error_k=[error_k;accuracy(1)];
                if accuracy(1)>accr
                    accr = accuracy(1)
%                     bestDim = dim
                end
            end
        end
        error = [error error_k];
        
%     end

end

