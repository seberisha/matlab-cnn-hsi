%%
cm_lm = enviLoadRaw('clas-map-lm.img', 'clas-map-lm.hdr');
labels_lm = cnn_resp2color(cm_lm).';

%%
labels_lm = labels_lm.*255/5;

%%
sc_lm = imread('brc961-br1001-1650.bmp');
sc_lm = sc_lm(1:size(labels_lm,1), 1:size(labels_lm,2));
sc_lm = double((sc_lm));
sc = sc.*255/(max(sc(:)) - min(sc(:)));
sc_lm = sc_lm./max(sc_lm(:));

%%
labels_lm = labels_lm.*sc_lm;

%%
zoom_lm = labels_lm(789:1388, 740:1666);
