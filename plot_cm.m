%%
red = [139,0,0]; %firebrick
blue = [0,0,205];
green = [0,100,0]; %forestgreen
%cyan = [0,139,139];
gold = [255,215,0]; %goldenrod
magenta = [200,0,200];
%purple = [128,0,128];

cmap = [red; blue; green; gold; magenta;];
cmap = cmap./255;

%% cnn-lm
cm_cnn_lm =  [[  1098      0    360     40     24]
    [   401  75025     53   4857      0]
    [  1128    254  75091   8305    872]
    [  1289  18117  30833 111365      1]
    [  2355      0   4249     40  46705]];

% normalize
for i = 1:5
   cm_cnn_lm(i,:) = cm_cnn_lm(i,:)./sum(cm_cnn_lm(i,:)); 
end

%%
figure, bh = bar3(cm_cnn_lm, 0.5), colormap(cmap)
% x vals are the columns of confusion, ys are the rows of confusion
classes = {'\color[rgb]{0.5451 0 0} blood',...
           '\color[rgb]{0 0 0.8039} collagen',...
           '\color[rgb]{0 0.3922 0} epithelium',...
           '\color[rgb]{1 0.8431 0 } myofibroblasts',...
           '\color[rgb]{0.7843 0 0.7843} necrosis'};
set(gca,'FontName', 'Calibri', 'fontsize',34, 'fontweight', 'bold');       
set(gca,'YTickLabel',classes);
set(gca,'XTickLabel',classes);
ylabel('Actual');
xlabel('Predicted');
zlabel('% of samples');
%zlim([0 max(cm_cnn_lm(:))]);
%zticklabels({'0','20,000','40,000','60,000','80,000','100,000'})
%get(gca, 'zticklabels')

%set(gca, 'zticklabels', {'0','20,000','40,000','60,000','80,000','100,000'})
remove_empty_bars(bh)

%%
set(gca, 'zticklabels', {'0','20', '40', '60', '80', '100'})

%%
spaceplots

%% rf-lm
load  /home/sberisha/papers/2017/analyst/ftir-cnn/data/rf-bcemn-lm-stats.mat
confusionmtx = double(confusionmtx);
% normalize
for i = 1:5
   confusionmtx(i,:) = confusionmtx(i,:)./sum(confusionmtx(i,:)); 
end

%%
figure, bh = bar3(confusionmtx, 0.5), colormap(cmap)
% x vals are the columns of confusion, ys are the rows of confusion
classes = {'\color[rgb]{0.5451 0 0} blood',...
           '\color[rgb]{0 0 0.8039} collagen',...
           '\color[rgb]{0 0.3922 0} epithelium',...
           '\color[rgb]{1 0.8431 0 } myofibroblasts',...
           '\color[rgb]{0.7843 0 0.7843} necrosis'};
set(gca, 'FontName', 'Calibri')
set(gca,'fontsize',34, 'fontweight', 'bold');   
set(gca,'YTickLabel',classes);
set(gca,'XTickLabel',classes);
ylabel('Actual');
xlabel('Predicted');
zlabel('% of samples');
%zlim([0 max(cm_cnn_lm(:))]);
%zticklabels({'0','20,000','40,000','60,000','80,000','100,000'})
%get(gca, 'zticklabels')
%set(gca, 'ZTick', 0:20000:max(confusionmtx(:)))
%set(gca, 'zticklabels', {'0','20,000','40,000','60,000','80,000'})
remove_empty_bars(bh)

%%
set(gca, 'zticklabels', {'0','20', '40', '60', '80', '100'})

%%
spaceplots




%% rf-hd
load /home/sberisha/source/python-classification/cm_rf_hd.mat
cm_rf_hd = double(cm_rf_hd);
% normalize
for i = 1:5
   cm_rf_hd(i,:) = cm_rf_hd(i,:)./sum(cm_rf_hd(i,:)); 
end

%%
figure, bh = bar3(cm_rf_hd, 0.5), colormap(cmap)
% x vals are the columns of confusion, ys are the rows of confusion
classes = {'\color[rgb]{0.5451 0 0} blood',...
           '\color[rgb]{0 0 0.8039} collagen',...
           '\color[rgb]{0 0.3922 0} epithelium',...
           '\color[rgb]{1 0.8431 0 } myofibroblasts',...
           '\color[rgb]{0.7843 0 0.7843} necrosis'};
set(gca, 'FontName', 'Calibri')
set(gca,'fontsize',34, 'fontweight', 'bold');       
set(gca,'YTickLabel',classes);
set(gca,'XTickLabel',classes);
ylabel('Actual');
xlabel('Predicted');
zlabel('% of samples');
%zlim([0 max(cm_rf_hd(:))]);
%zticklabels({'0','20,000','40,000','60,000','80,000','100,000'})
%get(gca, 'zticklabels')
%set(gca, 'ZTick', 0:20000:max(confusionmtx(:)))
remove_empty_bars(bh)

%%
set(gca, 'zticklabels', {'0','20', '40', '60', '80', '100'})

%%
spaceplots



%% cnn-hd

cm_cnn_hd =  [[  2732      6      0      0   1131]
 [    16 606365    174   3087      0]
 [    46      0 157412  43311   1046]
 [   890   9450  33755 264880    125]
 [   518      0      0    220 113435]];

% normalize
for i = 1:5
   cm_cnn_hd(i,:) = cm_cnn_hd(i,:)./sum(cm_cnn_hd(i,:)); 
end


%%
figure, bh = bar3((cm_cnn_hd), 0.5), colormap(cmap)
 %zlim([0, max((cm_cnn_hd(:)))]);

%set(gca,'ZScale','log')
% 
% llim = 0.01;
% 
% h = get(gca,'Children');
% 
% for i = 1:length(h)
% 
%        ZData = get(h(i), 'ZData');
% 
%        ZData(ZData==0) = llim;
% 
%        set(h(i), 'ZData', ZData);
% 
% end

% set(gca,'XScale','log')
% set(gca,'YScale','log')

% x vals are the columns of confusion, ys are the rows of confusion
classes = {'\color[rgb]{0.5451 0 0} blood',...
           '\color[rgb]{0 0 0.8039} collagen',...
           '\color[rgb]{0 0.3922 0} epithelium',...
           '\color[rgb]{1 0.8431 0 } myofibroblasts',...
           '\color[rgb]{0.7843 0 0.7843} necrosis'};
set(gca, 'FontName', 'Calibri')
set(gca,'fontsize',34, 'fontweight', 'bold');       
set(gca,'YTickLabel',classes);
set(gca,'XTickLabel',classes);
ylabel('Actual');
xlabel('Predicted');
zlabel('% of samples');

%zticklabels({'0','50','100' })
%get(gca, 'zticklabels')
%set(gca, 'ZTick', 0:20000:max(confusionmtx(:)))
remove_empty_bars(bh)

% baseline = 0.1;
% for i = 1 : numel(hBar)
%     z = get(hBar(i), 'ZData');
%     z(z == 0) = baseline;
%     set(hBar(i), 'ZData', z)
% end


%%
set(gca, 'zticklabels', {'0','20', '40', '60', '80', '100'})

%%
spaceplots



