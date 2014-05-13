load HW6_1.mat;
model = svmtrain(train_y, train_x, '-s 0 -t 0 -c 100');
[predicted_label,accuracy,decision_values]=svmpredict(train_y,train_x,model);
plotboundary(train_y,train_x,model)