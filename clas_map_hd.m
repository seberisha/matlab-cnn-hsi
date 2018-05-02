%%
addpath(genpath('/home/sberisha/source/stimlib/matlab'))

%%
fc = enviLoadRaw('cnn-resp-first-col-hd.img', 'cnn-resp-first-col-hd.hdr');
labels_fc = cnn_resp2color(fc).';
clear fc

%%
sc = enviLoadRaw('cnn-resp-sec-col-hd.img', 'cnn-resp-sec-col-hd.hdr');
labels_sc = cnn_resp2color(sc).';
clear sc

%%
tc = enviLoadRaw('cnn-resp-third-col-hd.img', 'cnn-resp-third-col-hd.hdr');
labels_tc = cnn_resp2color(tc).';
clear tc


%%
all = labels_fc + labels_sc + labels_tc;
all = all(3100:6050, 2750:6950 );
all(25:157 , 2981:4008) = 0;
all(all>5)=0;
%%
tm = imread('brc961-hd-image-1650.bmp');
tm = rgb2gray(tm);
tm = double(tm);
tm = tm./max(tm(:));
tm = tm(3100:6050, 2750:6950 );
%%
all = all.*255/5;
all = all.*tm;