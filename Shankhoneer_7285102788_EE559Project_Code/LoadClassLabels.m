function [ classLabels ] = LoadClassLabels( filename )
    formatSpec = '%d';
    fileId = fopen(filename,'r');
    classLabels = fscanf(fileId,formatSpec);
end
