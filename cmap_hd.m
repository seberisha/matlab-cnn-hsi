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

%% hd
spacing = [0 10 60 90 120 170]';
nmap = interp1(spacing./255, cmap,linspace(0,1,255));