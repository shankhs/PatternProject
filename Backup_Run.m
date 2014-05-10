function [ errorRate ] = Run(MAX_DIM,PARTITION, REPEAT, isNormalized,isReduceDim)
    maxDim=MAX_DIM;
    initData = LoadData('training_set/train_x.txt');
    classLabels = LoadClassLabels('training_set/train_y.txt');
    initData = initData';
    initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');
    initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');
    initTestIntData = initTestIntData';
    if isReduceDim==0
        maxDim=2;
    end
    [r,c] = size(initData);
    %N = prmemory(r*c*135);
    errorRate=[];
    for dim=2:maxDim
        data = initData;
        if isReduceDim==1
            data = data*klm(data,dim);
        end
        
        A = prdataset(data,classLabels); 
        if isNormalized==1
            A = A*normm;
        end

        %[r,c] = size(A);
        
%        trainData=[];
        classificationResults=[];
%        begin=1;
%         for j=1:REPEAT
%             A = A(randperm(size(A,1)),:);
%             
%             for i=1:PARTITION
%                 [train test] = DivideForCV(A,i, PARTITION)
% 
%                 %[train test] = gendat(A,PARTITION)
%                 %w1 = qdc(train);
%                 
%                 %w1 = svc(train,'p',2)*setbatch([],true,500,500)
%                 %w1 = qdc([]);
%                 w1 = knnc([],3);
%                 w1 = setbatch(w1,true,500,500);
%                 %w1 = qdc(train)*setbatch(train,true,500,500)
%                 w1 = train*w1;
%                 classification = test*w1
% 
%                 [result,erredClass] = testc(classification);
%                 classificationResults=[classificationResults;result];
%                 %result
%             end
%         end
        [errors, stds] = prcrossval(A,qdc,5,5);
%        baseline = mean(classificationResults);
%        baselineStd = std(classificationResults);


        testIntData = initTestIntData;
        testIntLabel = initTestIntLabel;
        if isReduceDim==1
            testIntData = testIntData*klm(testIntData,dim);
        end

%        [highestEff,index] = max(classificationResults);

        B = prdataset(testIntData,testIntLabel);
        if isNormalized==1
            B = B*normm;
        end
        w = qdc(A);

        classification = B*w;

        [result,erredClass] = testc(classification);

        confmat(classification);
        
        errorRate=[errorRate;result];
    end
end

