%%
b = imread('blood-left-brc961-hd.png'); b = rgb2gray(b); b = b./255;
a = imread('adipo-left-brc961-hd.png'); a = rgb2gray(a); a = a./255;
c = imread('col-left-brc961-hd.png'); c = rgb2gray(c); c = c./255;
e = imread('epit-left-brc961-hd.png');  e = e./255;
m = imread('myo-left-brc961-hd.png'); m = rgb2gray(m); m = m./255;
n = imread('nec-left-brc961-hd.png'); n = rgb2gray(n); n = n./255;
s = imread('secretions-left-brc961-hd.png');  s = s./255;

b = b.*2;
c = c.*3;
e = e.*4;
m = m.*5;
n = n.*6;
s = s.*7;
all = a + b + c + e + m + n + s;

%%
cd('/media/stim-processed/berisha/breast-processing/sd/br1003/')
%%
mask = imread('br1003-br2085b-cropped-corrected-tissue.bmp');
mask = rgb2gray(mask);
mask = mask./255;
%%
cd ('/media/stim-processed/berisha/breast-processing/sd/br1003/no-mnf-bcemn')
b = imread('blood-br1003-lm.png');  b = b(:, 1:3207); b = b./255; 
c = imread('col-br1003-lm.png');    c = c(:, 1:3207); c = c./255;
e = imread('epit-br1003-lm.png');   e = e(:, 1:3207); e = e./255;
m = imread('myo-br1003-lm.png');    m = m(:, 1:3207); m = m./255;
n = imread('nec-br1003-lm.png');    n = n(:, 1:3207); n = n./255;

%%
nb = b.*mask; nb = nb.*255;
nc = c.*mask; nc = nc.*255;
ne = e.*mask; ne = ne.*255;
nm = m.*mask; nm = nm.*255;
nn = n.*mask; nn = nn.*255;

%%
cd('/media/stim-processed/berisha/breast-processing/sd/br1003/new-masks')

%%
imwrite(nb, 'blo-sd-br1003.png')
imwrite(nc, 'col-sd-br1003.png')
imwrite(ne, 'epi-sd-br1003.png')
imwrite(nm, 'myo-sd-br1003.png')
imwrite(nn, 'nec-sd-br1003.png')


%%
cd('/media/stim-processed/berisha/breast-processing/sd/brc961/')
%%
mask = imread('brc961-br1001-cropped-bas-corrected-tissue.bmp');
mask = rgb2gray(mask);
mask = mask./255;
%%
cd ('/media/stim-processed/berisha/breast-processing/sd/brc961/no-mnf-bcemn/')
b = imread('blood-brc961-lm.png');  b = b(:, 1:3899); b = b./255; 
c = imread('col-brc961-lm.png');    c = c(:, 1:3899); c = c./255;
e = imread('epit-brc961-lm.png');   e = e(:, 1:3899); e = e./255;
m = imread('myo-brc961-lm.png');    m = m(:, 1:3899); m = m./255;
n = imread('nec-brc961-lm.png');    n = n(:, 1:3899); n = n./255;

%%
nb = b.*mask; nb = nb.*255;
nc = c.*mask; nc = nc.*255;
ne = e.*mask; ne = ne.*255;
nm = m.*mask; nm = nm.*255;
nn = n.*mask; nn = nn.*255;

%%
cd('/media/stim-processed/berisha/breast-processing/sd/brc961/new-masks/')

%%
imwrite(nb, 'blo-sd-br961.png')
imwrite(nc, 'col-sd-br961.png')
imwrite(ne, 'epi-sd-br961.png')
imwrite(nm, 'myo-sd-br961.png')
imwrite(nn, 'nec-sd-br961.png')



%%
cd('/media/stim-processed/berisha/breast-processing/hd/brc961/')
%%
mask = imread('brc961-hd-crop-bands-1000-bas-corrected-tissue.bmp');
mask = rgb2gray(mask);
mask = mask./255;
%%
cd ('/media/stim-scratch/berisha/00-annotations/hd/left-clas-masks/')
a = imread('adipo-left-brc961-hd.png');       a = rgb2gray(a); a = a./255; 
b = imread('blood-left-brc961-hd.png');       b = rgb2gray(b); b = b./255; 
c = imread('col-left-brc961-hd.png');         c = rgb2gray(c); c = c./255;
e = imread('epit-left-brc961-hd.png');        e = rgb2gray(e); e = e./255;
m = imread('myo-left-brc961-hd.png');         m = rgb2gray(m); m = m./255;
n = imread('nec-left-brc961-hd.png');         n = rgb2gray(n); n = n./255;
s = imread('secretions-left-brc961-hd.png');  s = rgb2gray(s); s = s./255;

%%
all = a + b*2 + c*3 + e*4 + m*5 + n*6 + s*7;
figure, imagesc(all), colorbar

a(all>7) = 0;
b(all>7) = 0;
c(all>7) = 0;
e(all>7) = 0;
m(all>7) = 0;
n(all>7) = 0;
s(all>7) = 0;

%%
na = a.*mask; na = na.*255;
nb = b.*mask; nb = nb.*255;
nc = c.*mask; nc = nc.*255;
ne = e.*mask; ne = ne.*255;
nm = m.*mask; nm = nm.*255;
nn = n.*mask; nn = nn.*255;
ns = s.*mask; ns = ns.*255;
%%
cd('/media/stim-processed/berisha/breast-processing/hd/brc961/new-left-masks/')

%%
imwrite(na, 'adi-hd-left-br961.png')
imwrite(nb, 'blo-hd-left-br961.png')
imwrite(nc, 'col-hd-left-br961.png')
imwrite(ne, 'epi-hd-left-br961.png')
imwrite(nm, 'myo-hd-left-br961.png')
imwrite(nn, 'nec-hd-left-br961.png')
imwrite(ns, 'sec-hd-left-br961.png')


