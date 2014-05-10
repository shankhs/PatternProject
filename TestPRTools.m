% Example for Gaussian data with different covariance matrices.
N = 100;

% Generate 100 points for each of three classes: means (0,0), (0,1), (1,1), and
% covariances [2 1; 1 4], [2 0 ; 0 2] and [2 0 ; 0 2].
D = gendatgauss([N N N], [0 0; 0 1; 1 1]* 3, cat(3, [2 1; 1 4], eye(2), eye(2)));

% Randomly split the data into training and testing, using 1/2 the data from each class.
[ Train, Test ] = gendat(D, [ N/2 N/2 N/2 ])

% Create quadratic discriminant, run and report error on test set.
C = qdc(Train);
Classification = Test*C;
disp('   Classification error for Quadratic classifier:')
testc(Classification)

% Display the data and the decision boundary.
figure;
scatterd(Train);
hold on;
plotc(C);