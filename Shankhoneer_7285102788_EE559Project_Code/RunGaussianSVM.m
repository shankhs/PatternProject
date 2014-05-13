function [ accuracy ] = RunGaussianSVM( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    accr=0;
    bestDim=0;
    error=[];

    for dim=1:1

        data = initData;
        testData = initTestIntData;
        A = prdataset(data,classLabels);
%         B = prdataset(testData,initTestIntLabel);
        A = A*normm;
%         A = A*fisherm(A,dim);
%         A = A*normm;
        
%         B = B*normm;
%         B = B*fisherm(B,dim);
%         B = B*normm;
%         A = A*klm(A,dim)
        error_k=[];

        for c=1:10
            for g = -5:2
                params = '-q -v 5 -s 0 -t 2 -c ';
                params = [params,num2str(2^c)];
                params = [params,' -g '];
                params = [params,num2str(2^g)]
                accuracy = svmtrain(classLabels,A.data,params);
%                 [predictedLabel,accuracy,decisionVals] = svmpredict(initTestIntLabel,B.data,model);
                dlmwrite('gaussianSvmError.txt',accuracy,'-append');
                error_k=[error_k;accuracy];
                if accuracy>accr
                    accr = accuracy
                    bestDim = dim
                end
            end
        end
        error = [error error_k];
        
%     end

end

