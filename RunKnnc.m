function [ error ] = RunKnnc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
    error=[];
    minErr=100;
    bestK=0;
    bestDim=0;
    completion=0;
    for dim=1:6
        for k=1:25
            data = initData;
            data = data(randperm(size(data,1)),:);
            testData = initTestIntData;
            testData = testData(randperm(size(testData,1)),:);
    %         data = data*klm(data,dim);
    %         testData = testData*klm(testData,dim);
            A = prdataset(data,classLabels);
            A = A*normm;
            A = A*fisherm(A,dim);
            B = prdataset(testData,initTestIntLabel);
            B = B*normm;
            B = B*fisherm(B,dim);
    %         if dim>1
    %             A = A*normm;
    %             B = B*normm;
    %         end
            error_k=[];
            w = knnc(A,k);
            classification = B*w;
            [result,erredClass] = testc(classification);
            if result<minErr
                minErr=result
                bestK=k
                bestDim=dim
            end
            error_k=[error_k;result];
            completion = completion+1;
            completion*100/(25*6)
        end
        error = [error error_k];
    end
end

