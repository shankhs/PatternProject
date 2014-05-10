load HW6_2.mat;
model = svmtrain(train_y, train_x, '-s 0 -t 1 -c 5000 -g 10');
[predicted_label,accuracy,decision_values]=svmpredict(train_y,train_x,model);
plotboundary(train_y,train_x,model)