function [samples, labels] = rf_load_data(envi_file_dir, train_mask_dir, mask_ext)

%% get mask names
dir_list = dir([train_mask_dir mask_ext]);
%get file names in directory
masks_fn = {dir_list(~[dir_list.isdir]).name};

%% get envi file name
dir_list = dir([envi_file_dir '*' '.hdr']);
[~, envi_fn, ~] = fileparts(dir_list.name);

%% load data
num_clas = numel(masks_fn);
labels = [];
samples = [];
M = enviLoadRaw([envi_file_dir envi_fn]);

for c = 1:num_clas
    class_mask = imread([train_mask_dir masks_fn{c}]);
    whos = find(class_mask');
    % matrix of size # of class samples x # of bands
    samples_c = (M(:,idx))';
    disp(['Loading Class ' masks_fn{c} ' --  # of samples: ' num2str(numel(idx))]);
    labels = [labels; c*ones(numel(idx), 1)];
    samples = [samples; samples_c]; 
end
disp('Done loading data.')