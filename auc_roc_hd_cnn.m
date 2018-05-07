%%auc roc for low mag data
addpath(genpath('~/source/stimlib/matlab/'))
cd /media/stim-processed/berisha/breast-processing/hd/brc961/masks/right/

%%
b = imread('blood-right-brc961-hd.png');
c = imread('col-right-brc961-hd.png');
e = imread('epit-right-brc961-hd.png');
m = imread('myo-right-brc961-hd.png');
n = imread('nec-right-brc961-hd.png');

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
cd /media/stim-processed/berisha/breast-processing/hd/
cr = enviLoadRaw('cnn-resp-bcemn-hd.img', 'cnn-resp-bcemn-hd.hdr');
cr = permute(cr, [2 1 3]);
cr = reshape(cr, size(cr,1)*size(cr,2),size(cr,3));
cr = cr(lab > 0, :);

lab = lab(lab>0);
[auc_cnn_hd, roc_cnn_hd] = roc_auc(cr, lab);
