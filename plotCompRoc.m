%%
function plotCompRoc(roc_a, roc_b, class_names)

lw = 2;
fs = 20;
%%
nc = size(roc_a,3);
for i = 1:nc
    f = figure;
    set(gca,'FontSize',fs,'fontweight','bold')
    xlabel('1 - specificity', 'fontweight', 'bold')
    ylabel('sensitivity', 'fontweight', 'bold')
    hold on
    plot(roc_a(:,1,i), roc_a(:,2,i), 'LineWidth',lw)
    hold on
    plot(roc_b(:,1,i), roc_b(:,2,i), 'LineWidth',lw)
    plot(0:0.1:1,0:0.1:1,'--r', 'LineWidth', 2)
    h_legend = legend(strcat(class_names{i}, ' - SVM'), strcat(class_names{i}, ' - CNN'),  'Location', 'Best');
    set(h_legend,'FontSize',fs,'fontweight','bold')
    grid on
    %set(gca,'LooseInset',get(gca,'TightInset'));
    %f.InvertHardcopy = 'off';
    %whitebg(f,'k')
end


%%



%print 'roc-cnn-bb' '-depsc' '-r300'


