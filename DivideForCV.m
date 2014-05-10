function [trgSample,testingSample] = DivideForCV(A,index,PARTITION)
    sz =size(A);
    fraction = 1/PARTITION;
    delta = sz(1)*fraction;
    begin=0;
    trgSample=[];
    testingSample=[];
    for i=1:PARTITION
        if i==index
            testingSample = [testingSample;A(begin*delta+1:(begin+1)*delta,:)];
        else
            trgSample = [trgSample;A(begin*delta+1:(begin+1)*delta,:)];
        end
        begin = begin+1;
    end
end

