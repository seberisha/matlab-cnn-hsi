%%
addpath(genpath('/home/sberisha/source/cnn-matlab'))

cd /home/sberisha/papers/2017/analyst/ftir-cnn/data/lm

fp = enviLoadRaw('cnn-response-first-part-lm.img', 'cnn-response-first-part-lm.hdr');

fp = permute(fp, [2 1 3]);
labels = cnn_resp2color(fp);


sp = enviLoadRaw('cnn-response-sec-part-lm.img', 'cnn-response-sec-part-lm.hdr');
sp = permute(sp, [2 1 3]);
labels_sp = cnn_resp2color(sp);
labels_fp = labels;
labels = [labels_fp labels_sp];
figure, imagesc(labels)
tp = enviLoadRaw('cnn-response-third-part-lm.img', 'cnn-response-third-part-lm.hdr');
tp = permute(tp, [2 1 3]);
labels_tp = cnn_resp2color(tp);
labels = [labels_fp labels_sp labels_tp];
figure, imagesc(labels)
m = imread('brc961-br1001-1650.bmp');
whos m
m = rgb2gray(m);
max(m(:))
m = double(m);
m = m./max(m(:));
max(labels(:))
labels = labels.*255/5;
max(labels(:))
imagesc(labels)
t = lables;
t = labels;
t = t.*m;
whos m
whos labels
whos labels_fp
labels_fp = labels_fp.*255/5;
imagesc(labels_fp)
m_fp = m(:,1:2320);
figure, imagesc(lm)
figure, imagesc(m_fp)
t = labels_fp.*m_fp;
imagesc(t)
colorbar
colorbar off
imagesc(t), colormap(map)
t_sp = labels_sp;
t_sp = t_sp.*255/5;
whos t_sp
m_sp = m(:,2300:4725);
whos m_sp
t_sp = t_sp.*m_sp;
figure, imagesc(t_sp), colormap(map)
t_tp = labels_tp;
m_tp = m(:,4720:end);
t_tp = t_tp.*255/5;
t_tp = t_tp.*m_tp;
figure, imagesc(t_tp), colormap(map)
clas_lm = [t t_sp t_tp];
figure, imagesc(clas_lm), colormap(map)

%% annotations for low mag data -- 5 classes

cd /media/stim-processed/berisha/breast-processing/lm/brc961/masks/no-mnf-bcemn
b = imread('blood-brc961-lm.png');
b = b./255;
c = imread('col-brc961-lm.png');
c = c./255; c = c.*2;
e = imread('epit-brc961-lm.png');
e = e./255; e = e.*3;
m = imread('myo-brc961-lm.png');
m = m./255; m = m.*4;
n = imread('nec-brc961-lm.png');
n = n./255; n = n.*5;
tm = b + c + e + m + n;
%% colormap
black = [0 0 0 ];
red = [139,0,0]; %firebrick
blue = [0,0,205];
green = [0,100,0]; %forestgreen
%cyan = [0,139,139];
gold = [255,215,0]; %goldenrod
magenta = [200,0,200];
%purple = [128,0,128];

amap = [black; red; blue; green; gold; magenta;];
amap = amap./255;

%%

figure, imagesc(tm), colormap(amap)

%%
cr_a_lm = tm(806-25:1401, 773-23:1652);
figure, imagesc(cr_a_lm), colormap(amap), axis image

%%
figure, imagesc(cr_a_lm), colormap(amap), axis off, axis image

%%
red = [139,0,0]; %firebrick
blue = [0,0,205];
green = [0,100,0]; %forestgreen
%cyan = [0,139,139];
gold = [255,215,0]; %goldenrodlh
magenta = [200,0,200];
%purple = [128,0,128];

camap = [red; blue; green; gold; magenta;];
camap = camap./255;

%%

labels = {'background', 'blood','collagen', 'epithelium', 'myofibroblasts', 'necrosis'};
lcolorbar(labels,'fontweight','bold', 'fontsize', 30, 'Location', 'Horizontal')