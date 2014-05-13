function data = LoadData(filename)
    formatSpec='';
    for i=1:54
        formatSpec=strcat(formatSpec,'%d');
        if i~=54
            formatSpec=strcat(formatSpec,',');
        end
    end
    
    fileId = fopen(filename,'r');
    sizeData = [54,inf];
    data = fscanf(fileId,formatSpec,sizeData);
    fclose(fileId);
end