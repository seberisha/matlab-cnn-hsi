%%
hd_ftir = imread('brc961-hd-crop-bands-bas-1650-09.bmp');
hd_ftir = rgb2gray(hd_ftir);
brew = stimBrewerMap(1024);

%%
figure, imagesc(hd_ftir), colormap(brew), axis off


%% dir /media/stim-processed/berisha/breast-processing/hd
cd('/media/stim-processed/berisha/breast-processing/hd')
hd_am  = imread('brc961-hd-crop-bands-image-1650-01.bmp');
hd_hf  = imread('brc961-hd-crop-bands-image-3799-01.bmp');

%%
addpath(genpath('/home/sberisha/source/stimlib/matlab'))
brew = stimBrewerMap(1024);

%%
cd('/media/stim-processed/berisha/breast-processing/hd/brc961/masks/left/')
b = imread('blood-left-brc961-hd.png');
b = b./255;


c = imread('col-left-brc961-hd.png');
c = c./255;
c = c*2;

e = imread('epit-left-brc961-hd.png');
e = e./255;
e = e*3;

m = imread('myo-left-brc961-hd.png');
m = m./255;
m = m*4;

n = imread('nec-left-brc961-hd.png');
n = n./255;
n = n*5;


ann = b + c + e + m + n;

%%
[i_b,j_b] = find(ann==1);
[i_c,j_c] = find(ann==2);
[i_e,j_e] = find(ann==3);
[i_m,j_m] = find(ann==4);
[i_n,j_n] = find(ann==5);


%%
cs = 129;
idx = 1e3;
b_am = hd_am(i_b(idx) - floor(cs/2) : i_b(idx) - floor(cs/2) + cs, j_b(idx) - floor(cs/2) : j_b(idx) - floor(cs/2) + cs); 
figure, imagesc(b_am), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

b_hf = hd_hf(i_b(idx) - floor(cs/2) : i_b(idx) - floor(cs/2) + cs, j_b(idx) - floor(cs/2) : j_b(idx) - floor(cs/2) + cs); 
figure, imagesc(b_hf), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

%%
idx = 1e4;
c_am = hd_am(i_c(idx) - floor(cs/2) : i_c(idx) - floor(cs/2) + cs, j_c(idx) - floor(cs/2) : j_c(idx) - floor(cs/2) + cs); 
figure, imagesc(c_am), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

c_hf = hd_hf(i_c(idx) - floor(cs/2) : i_c(idx) - floor(cs/2) + cs, j_c(idx) - floor(cs/2) : j_c(idx) - floor(cs/2) + cs); 
figure, imagesc(c_hf), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

%%
idx = 1e2;
e_am = hd_am(i_e(idx) - floor(cs/2) : i_e(idx) - floor(cs/2) + cs, j_e(idx) - floor(cs/2) : j_e(idx) - floor(cs/2) + cs); 
figure, imagesc(e_am), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

e_hf = hd_hf(i_e(idx) - floor(cs/2) : i_e(idx) - floor(cs/2) + cs, j_e(idx) - floor(cs/2) : j_e(idx) - floor(cs/2) + cs); 
figure, imagesc(e_hf), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

%%
idx = 1e2;
m_am = hd_am(i_m(idx) - floor(cs/2) : i_m(idx) - floor(cs/2) + cs, j_m(idx) - floor(cs/2) : j_m(idx) - floor(cs/2) + cs); 
figure, imagesc(m_am), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

m_hf = hd_hf(i_m(idx) - floor(cs/2) : i_m(idx) - floor(cs/2) + cs, j_m(idx) - floor(cs/2) : j_m(idx) - floor(cs/2) + cs); 
figure, imagesc(m_hf), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

%%
idx = 2e3;
n_am = hd_am(i_n(idx) - floor(cs/2) : i_n(idx) - floor(cs/2) + cs, j_n(idx) - floor(cs/2) : j_n(idx) - floor(cs/2) + cs); 
figure, imagesc(n_am), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));

n_hf = hd_hf(i_n(idx) - floor(cs/2) : i_n(idx) - floor(cs/2) + cs, j_n(idx) - floor(cs/2) : j_n(idx) - floor(cs/2) + cs); 
figure, imagesc(n_hf), colormap(brew), axis off, axis image
set(gca,'LooseInset',get(gca,'TightInset'));
