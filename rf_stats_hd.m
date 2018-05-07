

%%==========hd data========

%% params
train_mask_dir = '/media/stim-processed/berisha/breast-processing/hd/brc961/masks/left/'
mask_ext = '*.png'
envi_file_dir = '/media/stim-processed/berisha/breast-processing/hd/brc961/pca/cnn/'
n_threads = 12
n_trees = 100

%% load training data -lm
[train_samples, train_labels] = rf_load_data(envi_file_dir, train_mask_dir, mask_ext);
%% train with random forest

rf = rf_train(n_threads, n_trees, train_samples, train_labels);

%% load test data -lm
%envi_file_dir = '/media/stim-processed/berisha/breast-processing/hd/brc961/mnf-pca/'
train_mask_dir = '/media/stim-processed/berisha/breast-processing/hd/brc961/masks/right/'

[test_samples, test_labels] = rf_load_data(envi_file_dir, train_mask_dir, mask_ext);

%% validate using trained classifier
[Tpost,  Posterior, std] = predict(rf, test_samples);


%% compute confusion matrix and overall accuracy
confusionmtx = zeros(numel(unique(test_labels)));
Tpo = str2num(cell2mat(Tpost));
num_samples = length(test_labels);
for i = 1: num_samples
    confusionmtx(test_labels(i),Tpo(i)) = confusionmtx(test_labels(i),Tpo(i))+ 1;
end
accuracy = trace(confusionmtx)/length(test_labels)

%%  compute auc roc
[auc_rf_hd, roc_rf_hd] = roc_auc(Posterior, test_labels);
