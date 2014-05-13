nNumberCols = 54;
format = [repmat('%f,', [1 nNumberCols]) '%s'];
fid = fopen('training_set/train_x.txt');
while ~feof(fid)
    x = textscan(fid, format);
    b = cat(2, x{1:nNumberCols});
    B=[B;b];
end
size(B)
fclose(fid);
% C = x{end};