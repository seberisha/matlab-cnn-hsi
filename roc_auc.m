function [auc, roc, idx] = roc_auc(prob, true_labels)

%% compute Area under ROC curve, 
num_classes = length(unique(true_labels));			% find total number of classes
auc = zeros(1, num_classes);	  %initialize area under ROC curve for each class to zero;
roc = zeros(length(prob), 2, num_classes);
idx = zeros(length(true_labels), num_classes);
%%
for c = 1:num_classes
    T_v = zeros( length(true_labels), 1);
    T_v(true_labels == c) = 1;
    disp('Calculating ROC...');
    tRocTime = tic;
    [roc(:,:,c), Cauc, ~, idx(:,c)] = rtsROC( prob(:,c), T_v);
    disp(['Time: ' num2str(toc(tRocTime)) 's']);
    disp(['AUC = ' num2str(Cauc)]);
    auc(1,c) = Cauc;
end
