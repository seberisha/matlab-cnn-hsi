%%auc roc for low mag data
addpath(genpath('~/source/stimlib/matlab/'))
cd /Users/sbstn/papers/2017/analyst/paper-cnn/data/brc961-lm/masks/no-mnf-bcemn/

%%
b = imread('blood-brc961-lm.png');
c = imread('col-brc961-lm.png');
e = imread('epit-brc961-lm.png');
m = imread('myo-brc961-lm.png');
n = imread('nec-brc961-lm.png');

b = b./max(b(:));
c = c./max(c(:));
e = e./max(e(:));
m = m./max(m(:));
n = n./max(n(:));
%%
c = c.*2;
e = e.*3;
m = m.*4;
n = n.*5;
lab = b + c + e + m + n;

%%
lab = lab(:);
cd /Users/sbstn/papers/2017/analyst/paper-cnn/data
cr = enviLoadRaw('cnn-response-lm-acc-80-11-response');
cr = permute(cr, [2 1 3]);
cr = reshape(cr, size(cr,1)*size(cr,2),size(cr,3));
cr = cr(lab > 0, :);

lab = lab(lab>0);

%%
addpath(genpath('/Users/sbstn/papers/2017/analyst/paper-cnn/codes'))
[auc_lm_cnn, roc_lm_cnn] = roc_auc(cr, lab);

%%
cd /Users/sbstn/papers/2017/analyst/paper-cnn/data/hd/
load pred_prob_svm_sd_balanced.mat

%%
load true_labels_svm_sd_balanced.mat

%%
[auc_lm_svm, roc_lm_svm] = roc_auc(pred_prob_svm_sd_balanced , true_labels_svm_sd_balanced');