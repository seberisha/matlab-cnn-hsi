function [ROC, AUC, T, idx] = rtsROC(thresholds, class)

%Computes the ROC curves given a set of thresholds and class assignments
% class = boolean array describing actual class membership
% thresholds = threshold values for class assignment
% ROC = ROC curve as column vectors (1 = 1-specificity, 2 = sensitivity)
% AUC = area under the ROC curve computed using the trapezoid method
% T = threshold values associated with each 1-specificity value

nValues = length(thresholds);
ROC = zeros(nValues, 2);

%sort both arrays
[T, ix] = sort(thresholds, 'descend');
C = class(ix);

%compute the necessary global values
P = nnz(class);
N = nValues - P;

for i = 1:nValues
    TP = nnz(C(1:i));
    sensitivity = TP/P;
    
    FP = i - TP;
    FPR = FP/N;
    specificity = 1 - FPR;
    
    ROC(i, 1) = 1 - specificity;
    ROC(i, 2) = sensitivity;
end
idx = ix;
AUC = trapz(ROC(:, 1), ROC(:, 2));
    
    