% Use random forest to compute
%   - class probabilities for each sample
%   - confusion matrix

%% add libs to path
addpath(genpath('~/source/stimlib/matlab/'))
%% load training data in format:
%   F_t -- matrix of size # of samples x # of bands
%           stacked as classes of samples
%   labels -- vector of size # of samples in format 1, 2, ..., # of classes

%% params
train_mask_dir = '/media/stim-processed/berisha/breast-processing/lm/br1003/masks/no-mnf-bcemn/'
mask_ext = '*.png'
envi_file_dir = '/media/buffer/berisha/cnn-hsi/lm/br1003/no-mnf/cnn/'
n_threads = 12
n_trees = 100

%% load training data -lm
[train_samples, train_labels] = rf_load_data(envi_file_dir, train_mask_dir, mask_ext);
%% train with random forest

rf = rf_train(n_threads, n_trees, train_samples, train_labels);

%% load test data -lm
envi_file_dir = '/media/buffer/berisha/cnn-hsi/lm/br1003/no-mnf/brc961-proj/cnn/'
train_mask_dir = '/media/stim-processed/berisha/breast-processing/lm/brc961/masks/no-mnf-bcemn/'

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
[auc_rf_lm, roc_rf_lm] = roc_auc(Posterior, test_labels);

