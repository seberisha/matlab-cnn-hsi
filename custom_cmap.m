 %%
black = [0 0 0];
red = [139,0,0];
blue = [0,0,205];
green = [0,100,0];
%cyan = [0,139,139];
%gold = [255,215,0];
magenta = [139,0,139];
purple = [147,112,219];

 
%cm = [black; red; blue; green; cyan; gold; magenta; purple];
cmap = [black; red; blue; green; magenta; purple];
cmap = cmap./255;

%% hd
spacing = [0 15 70 120 200 255]';
map = interp1(spacing./255, cmap,linspace(0,1,255));

%%
%lm
%cm = cm./255;
%spacing = [0 10 20 80 120 150 230 255]';
%spacing = linspace(0,255,5)';
spacing = [0 15 70 120 200 255]';
map = interp1(spacing./255, cmap,linspace(0,1,255));

 
%%
n = 256;
black = zeros(n,3);
red = [linspace(0,139/255,n)',zeros(n,2)];
blue = [zeros(n,2),linspace(0,205/255,n)'];
green = [zeros(n,1),linspace(0,100/255,n)',zeros(n,1)];
cyan = [zeros(n,1),linspace(0,139/255,n)',linspace(0,139/255,n)'];
gold = [linspace(0,255/255,n)',linspace(0,215/255,n)',zeros(n,1)];
magenta = [linspace(0,139/255,n)',zeros(n,1),linspace(0,139/255,n)'];
purple = [linspace(0,147/255,n)',linspace(0,112/255,n)',linspace(0,219/255,n)'];

 
cmap = [black; red; blue; green; magenta; purple];
%cm = cm./255;