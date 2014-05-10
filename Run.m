function [ errorRate,baselineErrorRate,baselineStd ] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION, REPEAT, isNormalized,isReduceDim)
    maxDim=MAX_DIM;
    
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
        
        [baselineErrorRate,baselineStd] = prcrossval(A,qdc,PARTITION,REPEAT);
        
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

        %[cm,ne,lab1,lab2]=confmat(classification);
        confmat(classification);
        errorRate=[errorRate;result];
%         if dim<=2
%             figure
%             B=[A;B];
%             B = setname(B,'7-class Dataset');
%             scatterd(B,'.');drawnow;
%             plotc(w,'col');drawnow;
%             hold on;
%             scatterd(B,'legend');
%             %scatterd(A,'legend');
%             hold off;
%             
%             %disp(classification);
%         end
    end
end

