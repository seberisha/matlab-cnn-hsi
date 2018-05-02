%%
black = [0 0 0];
red = [139,0,0]; %firebrick
blue = [0,0,205];
green = [0,100,0]; %forestgreen
%cyan = [0,139,139];
gold = [255,215,0]; %goldenrod
magenta = [200,0,200];
%purple = [128,0,128];

 
%cm = [black; red; blue; green; cyan; gold; magenta; purple];
cmap = [black; red; blue; green; gold; magenta];
cmap = cmap./255;

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

left_hd_ann = b + c + e + m + n;

%%
cd('/media/stim-processed/berisha/breast-processing/hd/brc961/masks/right/')
b = imread('blood-right-brc961-hd.png');
b = b./255;


c = imread('col-right-brc961-hd.png');
c = c./255;
c = c*2;

e = imread('epit-right-brc961-hd.png');
e = e./255;
e = e*3;

m = imread('myo-right-brc961-hd.png');
m = m./255;
m = m*4;

n = imread('nec-right-brc961-hd.png');
n = n./255;
n = n*5;

right_hd_ann = b + c + e + m + n;

%%
total_hd_ann = left_hd_ann + right_hd_ann;


%%%%%%%%%%%% SD %%%%%%%%%%%%%%

cd 