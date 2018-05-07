%% setup
addpath(genpath('~/source/rf-matlab/'))

%% load training data

path = '/media/buffer/berisha/cnn-hsi/lm/br1003/rf/br1003/';
EnviFileName_t = [path 'br1003-mnf16-bas-nor-fin-pca16'];
EnviHeaderName_t = [path 'br1003-mnf16-bas-nor-fin-pca16.hdr'];
path1 = '/media/stim-processed/berisha/breast-processing/lm/br1003/masks/original/';
train_masks = {[path1 'blood.png'], [path1 'coll.png'], [path1 'epith.png'],  [path1 'myo.png'], [path1 'necrosis.png']};

%RoiImages_t = train_masks(1:5);
%RoiImages_t = {[path1 'blood.png'], [path1 'coll.png'], [path1 'epith.png'],  [path1 'lymph.png'], [path1 'necrosis.png']};
RoiImages_t = train_masks;
[F_t, Label]= GA_loading_data(EnviFileName_t, EnviHeaderName_t, RoiImages_t);

%% load validation data
path = '/media/buffer/berisha/cnn-hsi/lm/br1003/rf/brc961/';
EnviFileName_v = [path 'brc961-mnf16-bas-nor-fin-pbr1003-pca16'];
EnviHeaderName_v = [path 'brc961-mnf16-bas-nor-fin-pbr1003-pca16.hdr'];
path1 = '/media/stim-processed/berisha/breast-processing/lm/brc961/masks/original/';
test_masks = {[path1 'blood-brc961-lm.png'], [path1 'col-brc961-lm.png'], [path1 'epit-brc961-lm.png'], [path1 'myo-brc961-lm.png'], [path1 'nec-brc961-lm.png']};

%RoiImages_v = test_masks(1:5);
%RoiImages_v = {[path1 'blood.png'], [path1 'coll.png'], [path1 'epith.png'], [path1 'lymph.png'], [path1 'necrosis.png']};
RoiImages_v = test_masks;
[F_v, Labelv]= GA_loading_data(EnviFileName_v, EnviHeaderName_v, RoiImages_v);

%% 
%train classifier with randomforest algorithm
rf = rmEnviRandomForest2C_train(F_t, Label);
%validate using trained classifier
[Tpost,  Posterior, std] = predict(rf, F_v);

%compute Area under ROC curve, Confusion matrix and accuracy of predicted results
nC = length(unique(Label));			% find total number of classes
AUC = zeros(1, nC);	  %initialize area under ROC curve for each class to zero;

%%
 confusionmtx = zeros(nC);
 Tpo = str2num(cell2mat(Tpost));
 for i = 1: length(Labelv)
    confusionmtx(Labelv(i),Tpo(i)) = confusionmtx(Labelv(i),Tpo(i))+ 1;
 end
 accuracy = trace(confusionmtx)/length(Labelv)
