%%
m = imread('brc961-ck_x5.tif');
c1 = m(2630:3580, 3800:4750, :);
figure, imagesc(c1), axis image, axis off
c2 = m(3850:4800, 3750:4700, :);
figure, imagesc(c2), axis image, axis off

%%
m = imread('brc961-he_x5.tif');
c1 = m(2950:3900, 2900:3850, :);
figure, imagesc(c1), axis image, axis off
c2 = m(4120:5070, 2860:3810, :);
figure, imagesc(c2), axis image, axis off

%%
m = imread('brc961-tr_x5.tif');

c1 = m(2925:3875, 3200:4150, :);
figure, imagesc(c1), axis image, axis off

c2 = m(4140:5090, 3100:4050, :);
figure, imagesc(c2), axis image, axis off

%%
m = imread('brc961-vim_x5.tif');

c1 = m(2150:3100, 4550:5500, :);
figure, imagesc(c1), axis image, axis off

c2 = m(3350:4300, 4500:5450, :);
figure, imagesc(c2), axis image, axis off