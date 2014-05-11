function [ ] = DrawPlot( reduceNormDimErrorRate , filename )
    [r,c] = size(reduceNormDimErrorRate);
    x=[];
    legendString=[];
    for i=1:r
        x=[x;i+1];
    end
    H=figure;
    Y=[];
    for i=1:c
        %legendString = strcat(legendString,'''',num2str(i),''',')
        legendInfo{i} = [num2str(i)];
        Y=[Y,reduceNormDimErrorRate(:,i:i)]
    end
    
    
    hold on;
    for i=1:c
        hstem = stem(x,reduceNormDimErrorRate(:,i:i));
    end
    hold off;
    xlabel('Dimension');
    ylabel('Error rate')
%     legend(legendInfo);
    saveas(H,filename,'jpg');
end

