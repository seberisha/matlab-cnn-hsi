%%
function plotRoc(roc)

lw = 3;
fs = 16;
%%
f = figure
plot(roc(:,1,1), roc(:,2,1), 'LineWidth',lw)

set(gca,'FontSize',fs,'fontweight','bold')
xlabel('1 - specificity', 'fontweight', 'bold')
ylabel('sensitivity', 'fontweight', 'bold')
hold on

nc = size(roc,3)
for i = 2:nc
    plot(roc(:,1,i), roc(:,2,i), 'LineWidth',lw)
end

plot(0:0.1:1,0:0.1:1,'--r', 'LineWidth', 2)
%%
h_legend = legend('blood', 'collagen', 'fibro', 'epithelium', 'lymphocytes', 'myo', 'necrosis',  'Location', 'Best');
set(h_legend,'FontSize',fs,'fontweight','bold')

grid on
f.InvertHardcopy = 'off';
whitebg(f,'k')

%print 'roc-cnn-bb' '-depsc' '-r300'


