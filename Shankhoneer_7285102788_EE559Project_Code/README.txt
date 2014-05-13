**************************************************************************************

AUTHOR=Shankhoneer Chakrovarty (chakrova@usc.edu)

****************************************************************************************************************************************************************************

TABLE OF CONTENTS

1. Included Files
2. Installation Instruction
3. Descriptions and instructions

****************************************************************************************************************************************************************************

INCLUDED FILES

Following files are added to this package:
1. prtools5(version 4.1)
2. libsvm version-3.17
3. Main.m
4. Run.m
5. LoadData.m
6. LoadClassLabels.m
7. RunLinearSVM.m
8. RunGaussianSVM.m
9. RunKnnc.m
10.RunLdc.m
11.RunPerlc.m
12.TestKnnc.m
13.TestLdc.m
14.TestPerlc.m
15.TestSvm.m
16.DrawPlot.m

****************************************************************************************************************************************************************************

INSTALLATION INSTRUCTION

1. Unzip the whole package in one folder and start matlab
2. Change the working directory of matlab to where the package was unzipped
3. Add prtools and libsvm-3.17/windows to the path of matlab

****************************************************************************************************************************************************************************

DESCRIPTIONS AND INSTRUCTIONS

1. prtools5(version 4.1)
	This is the library which contains essentially all the classifiers, cross 
	validation methods and datastructure to store the data

2. libsvm version-3.17
	My project uses the implementation of svm from this library

3. Main.m
	This matlab script contains example of how to run all the function namely 
	baseline performance measure, knnc, ldc, perlc and svm

4. Run.m
	This function does the baseline performance measure.
	<Function Signature> [ errorRate,crossvalErrorRate,crossvalStd ] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION, REPEAT, isNormalized,isReduceDim)
	<Examples>
	[errorRate,crossvalErrorRate,crossvalStd]=Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,0)
	[normErrorRate,normBaselineErrorRate,normBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,0)
	[reduceDimErrorRate,reduceDimBaselineErrorRate,reduceDimBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,0,1)
	[reduceDimNormErrorRate,reduceDimNormBaselineErrorRate,reduceDimNormBaselineStd] = Run(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM,PARTITION,REPEAT,1,1)

5. LoadData.m
	Loads training and testing data only not the class labels
	<Function Signature> data = LoadData(filename)
	<Examples>
	initData = LoadData('training_set/train_x.txt');
	initTestIntData = LoadData('testing_set_int_labeled/test_x_int_L.txt');

6. LoadClassLabels.m
	Loads the class labels
	<Function Signature>[ classLabels ] = LoadClassLabels( filename )
	<Examples>
	classLabels = LoadClassLabels('training_set/train_y.txt');
	initTestIntLabel = LoadClassLabels('testing_set_int_labeled/test_y_int_L.txt');

7. RunLinearSVM.m
	This functions performs cross validation and estimates optimal dimension and correspoding optimal `c' value of linear svm classifier
	<Function Signature>[ accuracy ] = RunLinearSVM( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
	<Example>
	linearSvmErrorRate = RunLinearSVM(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);

8. RunGaussianSVM.m
	This function performs cross validation and estimates optimal dimesions and parameter values 
	i.e. optimal `c' and `gamma' of gaussian svm classifier
	<Function Signature>[ accuracy ] = RunGaussianSVM( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
	<Examples>
	gaussianSvmErrorRate = RunGaussianSVM(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
	
9. RunKnnc.m
	It is used to perform cross validation and estimate optimal dimension and k value of k-NN classifier
	<Function Signature>[ error ] = RunKnnc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
	<Example>
	knnErrorRate = RunKnnc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
	
10.RunLdc.m
	This function estimates optimal dimension for LDC classifier using cross validation
	<Function Signature>[ error ] = RunLdc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
	<Exanple>
	ldcErrorRate = RunLdc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);

11.RunPerlc.m
	It is used to perform cross validation and estimate optimum dimesion for perceptron classifier (perlc)
	<Function Signature>[ error ] = RunPerlc( initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM )
	<Exanple>
	[perlErrorRate] = RunPerlc(initData,classLabels,initTestIntData,initTestIntLabel,MAX_DIM);
	
12.TestKnnc.m
	This script determines the k-NN classifier's accuracy on intermediate and final testing dataset. The optimum parameters are hard coded in this script.

13.TestLdc.m
	This script determines the LDC classifier's accuracy on intermediate and final testing dataset. The optimum parameters are hard coded in this script.
	
14.TestPerlc.m
	This script determines the Perceptron's accuracy on intermediate and final testing dataset. The optimum parameters are hard coded in this script.

15.TestSvm.m
	This script determines the SVM's accuracy on intermediate and final testing dataset. The optimum parameters are hard coded in this script. 
	Apart from optimal parameters, linear and gaussian SVM differ only in their value of -t switch which is manually modified in the same script to change the nature of the svn.
	
16.DrawPlot.m
	This function draws plots of error rate vs dimension
	<Function Signature> DrawPlot( reduceNormDimErrorRate , filename )
	<Example>
	DrawPlot(knnErrorRate,'knnErrorPlot');

****************************************************************************************************************************************************************************