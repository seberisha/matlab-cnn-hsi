%%
cm = enviLoadRaw('cnn-resp-first-col-hd.img', 'cnn-resp-first-col-hd.hdr');
labels_1 = cnn_resp2color(cm).';

%%
sc = imread('brc961-hd-image-1650.bmp');
sc = double(rgb2gray(sc));
sc = sc.*255/(max(sc(:)) - min(sc(:)));
sc = sc./max(sc(:));

%%
cm = enviLoadRaw('cnn-resp-sec-col-hd.img', 'cnn-resp-sec-col-hd.hdr');
labels_2 = cnn_resp2color(cm).';

%%
cm = enviLoadRaw('cnn-resp-third-col-hd.img', 'cnn-resp-third-col-hd.hdr');
labels_3 = cnn_resp2color(cm).';

%%
labels_hd = labels_1 + labels_2 + labels_3;
labels_hd(labels_hd>5)=0;
%%
temp = labels_hd.*255/5;
temp = temp.*sc;

%%
thd = temp(3150:6050, 2702:6946 );
