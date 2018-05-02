%%
a = imread('ado-left-hd.png'); a = rgb2gray(a); a = a./255;
nnz(a)

b = imread('blo-left-hd.png'); b = rgb2gray(b); b = b./255; b = b *2;
nnz(b)

c = imread('col-left-hd.png'); c = rgb2gray(c); c = c./255; c = c *3;
nnz(c)

e = imread('epi-left-hd.png'); e = rgb2gray(e); e = e./255; e = e *4;
nnz(e)

m = imread('myo-left-hd.png'); m = rgb2gray(m); m = m./255; m = m *5;
nnz(m)

n = imread('nec-left-hd.png'); n = rgb2gray(n); n = n./255; n = n *6;
nnz(n)

s = imread('sec-left-hd.png'); s = rgb2gray(s); s = s./255; s = s *7;
nnz(s)

all = a + b + c + e + m + n + s;
figure, imagesc(all), colorbar

%%
a(all>7) = 0; 
b(all>7) = 0;
c(all>7) = 0;
e(all>7) = 0;
m(all>7) = 0;
n(all>7) = 0;
s(all>7) = 0;

all = a + b + c + e + m + n + s;

figure, imagesc(all), colorbar

%%
a(a>0) = 255;
b(b>0) = 255;
c(c>0) = 255;
e(e>0) = 255;
m(m>0) = 255;
n(n>0) = 255;
s(s>0) = 255;

%%
nnz(a)
nnz(b)
nnz(c)
nnz(e)
nnz(m)
nnz(n)
nnz(s)

%%
imwrite(a, 'ado-left-hd.png');
imwrite(b, 'blo-left-hd.png');
imwrite(c, 'col-left-hd.png');
imwrite(e, 'epi-left-hd.png');
imwrite(m, 'myo-left-hd.png');
imwrite(n, 'nec-left-hd.png');
imwrite(s, 'sec-left-hd.png');

%%
a = imread('ado-right-hd.png'); a = rgb2gray(a); a = a./255;
nnz(a)

b = imread('blo-right-hd.png'); b = rgb2gray(b); b = b./255; b = b *2;
nnz(b)

c = imread('col-right-hd.png'); c = rgb2gray(c); c = c./255; c = c *3;
nnz(c)

e = imread('epi-right-hd.png'); e = rgb2gray(e); e = e./255; e = e *4;
nnz(e)

m = imread('myo-right-hd.png'); m = rgb2gray(m); m = m./255; m = m *5;
nnz(m)

n = imread('nec-right-hd.png'); n = rgb2gray(n); n = n./255; n = n *6;
nnz(n)

s = imread('sec-right-hd.png'); s = rgb2gray(s); s = s./255; s = s *7;
nnz(s)

all = a + b + c + e + m + n + s;
figure, imagesc(all), colorbar


%%

%%
a = imread('ado-left-hd.png'); 

b = imread('blo-left-hd.png'); 
c = imread('col-left-hd.png'); 

e = imread('epi-left-hd.png'); 

m = imread('myo-left-hd.png'); 

n = imread('nec-left-hd.png'); 

s = imread('sec-left-hd.png'); 

all = a + b + c + e + m + n + s;
figure, imagesc(all), colorbar