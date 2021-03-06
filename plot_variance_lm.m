%% setup 
addpath(genpath('/home/sberisha/source/stimlib/matlab'))
addpath(genpath('/home/sberisha/papers/2017/analyst/ftir-cnn/codes/'))
fig_path = '/home/sberisha/papers/2017/analyst/ftir-cnn/figures/';
lm_data_path = '/home/sberisha/papers/2017/analyst/ftir-cnn/data/lm/';

%% variance for br1003
fs = 20;
lw = 2;
cd(lm_data_path)
s = enviLoadHeader('br1003-br2085b-bas-nor-fin.hdr');

figure
spec = csvread('blood-mean-lm-train.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')


grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'br1003-blood-var-lm'], '-depsc', '-r300')
print([fig_path 'br1003-blood-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('col-mean-lm-train.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('collagen', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'br1003-col-var-lm'], '-depsc', '-r300')
print([fig_path 'br1003-col-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('epit-mean-lm-train.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('epithelium', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'br1003-epit-var-lm'], '-depsc', '-r300')
print([fig_path 'br1003-epit-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('myo-mean-lm-train.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'br1003-myo-var-lm'], '-depsc', '-r300')
print([fig_path 'br1003-myo-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('nec-mean-lm-train.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('necrosis', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'br1003-nec-var-lm'], '-depsc', '-r300')
print([fig_path 'br1003-nec-var-lm'], '-dpng', '-r300')




%% variance for brc961
fs = 20;
lw = 2;
path = '/home/sberisha/papers/2017/analyst/ftir-cnn/figures/';
s = enviLoadHeader('brc961-br1001-bas-nor-fin-bip.hdr')
fs = 20;


figure
spec = csvread('blood-mean-lm-test.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')


grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'brc961-blood-var-lm'], '-depsc', '-r300')
print([fig_path 'brc961-blood-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('col-mean-lm-test.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('collagen', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'brc961-col-var-lm'], '-depsc', '-r300')
print([fig_path 'brc961-col-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('epit-mean-lm-test.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('epithelium', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'brc961-epit-var-lm'], '-depsc', '-r300')
print([fig_path 'brc961-epit-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('myo-mean-lm-test.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([fig_path 'brc961-myo-var-lm'], '-depsc', '-r300')
print([fig_path 'brc961-myo-var-lm'], '-dpng', '-r300')

%%
figure
spec = csvread('nec-mean-lm-test.csv');
plot(s.wavelength, spec(2,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[0 0.4])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('necrosis', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-nec-var-lm'], '-depsc', '-r300')
print([path 'brc961-nec-var-lm'], '-dpng', '-r300')


%% random br1003
fs = 20;
lw = 2;
path = '/home/sberisha/papers/2017/analyst/ftir-cnn/figures/';
s = enviLoadHeader('br1003-mnf16-bas-nor-fin.hdr')

figure
spec = csvread('br1003-mnf16-bas-nor-fin-blood-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')

grid on
set(gca,'LooseInset',get(gca,'TightInset'));

print([path 'br1003-blood-ran'], '-depsc', '-r300')
print([path 'br1003-blood-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('br1003-mnf16-bas-nor-fin-col-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('collagen', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-col-ran'], '-depsc', '-r300')
print([path 'br1003-col-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('br1003-mnf16-bas-nor-fin-epit-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('epithelium', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-epit-ran'], '-depsc', '-r300')
print([path 'br1003-epit-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('br1003-mnf16-bas-nor-fin-fib-spec');

plot(s.wavelength, spec, 'LineWidth',lw);
xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('fibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-fib-ran'], '-depsc', '-r300')
print([path 'br1003-fib-ran'], '-dpng', '-r300')

%%
figure
lw = 2;
spec = csvread('br1003-mnf16-bas-nor-fin-lym-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('lymphocytes', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-lym-ran'], '-depsc', '-r300')
print([path 'br1003-lym-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('br1003-mnf16-bas-nor-fin-nec-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('necrosis', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-nec-ran'], '-depsc', '-r300')
print([path 'br1003-nec-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('br1003-mnf16-bas-nor-fin-myo-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'br1003-myof-ran'], '-depsc', '-r300')
print([path 'br1003-myof-ran'], '-dpng', '-r300')

%% random specs for br1003
path = '/home/sberisha/papers/2017/analyst/ftir-cnn/figures/';

s = enviLoadHeader('br1003-mnf16-bas-nor-fin.hdr')
fs = 20;
lw = 1;
figure
spec = csvread('br1003-mnf16-bas-nor-fin-blood-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
hold on;
spec = csvread('br1003-mnf16-bas-nor-fin-col-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('br1003-mnf16-bas-nor-fin-epit-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('br1003-mnf16-bas-nor-fin-fib-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('br1003-mnf16-bas-nor-fin-lym-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('br1003-mnf16-bas-nor-fin-nec-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('br1003-mnf16-bas-nor-fin-myo-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.1 1.1])
%xlabel('Wavenumber (cm^{-1})','fontweight','bold') 
%ylabel(gca,'Absorbance','fontweight','bold') 
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold')

set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'collagen', 'epithelium', 'fibroblasts',  'lymphocytes', 'necrosis', 'myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',14, 'fontweight','bold')
legend boxoff 
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
%%
print([path 'br1003-ran-spec'], '-depsc', '-r300')
print([path 'br1003-ran-spec'], '-dpng', '-r300')

%% random specs for brc961
s = enviLoadHeader('brc961-mnf16-bas-nor-fin.hdr')
fs = 20;
lw = 1;
figure
spec = csvread('brc961-mnf16-bas-nor-fin-blood-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
hold on;
spec = csvread('brc961-mnf16-bas-nor-fin-col-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('brc961-mnf16-bas-nor-fin-epit-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('brc961-mnf16-bas-nor-fin-fib-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('brc961-mnf16-bas-nor-fin-lym-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('brc961-mnf16-bas-nor-fin-nec-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);
spec = csvread('brc961-mnf16-bas-nor-fin-myo-spec');
plot(s.wavelength, spec(1,:), 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.1 1.1])
%xlabel('Wavenumber (cm^{-1})','fontweight','bold') 
%ylabel(gca,'Absorbance','fontweight','bold') 
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold')

set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'collagen', 'epithelium', 'fibroblasts', 'lymphocytes', 'necrosis', 'myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',14, 'fontweight','bold')
legend boxoff 
grid on
set(gca,'LooseInset',get(gca,'TightInset'));

%%
print([path 'brc961-ran-spec'], '-depsc', '-r300')
print([path 'brc961-ran-spec'], '-dpng', '-r300')













%% random brc961
fs = 20;
lw = 2;
path = '/home/sberisha/papers/2017/analyst/ftir-cnn/figures/';
s = enviLoadHeader('brc961-mnf16-bas-nor-fin.hdr')

figure
spec = csvread('brc961-mnf16-bas-nor-fin-blood-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('blood', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')

grid on
set(gca,'LooseInset',get(gca,'TightInset'));

print([path 'brc961-blood-ran'], '-depsc', '-r300')
print([path 'brc961-blood-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('brc961-mnf16-bas-nor-fin-col-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('collagen', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-col-ran'], '-depsc', '-r300')
print([path 'brc961-col-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('brc961-mnf16-bas-nor-fin-epit-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('epithelium', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-epit-ran'], '-depsc', '-r300')
print([path 'brc961-epit-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('brc961-mnf16-bas-nor-fin-fib-spec');

plot(s.wavelength, spec, 'LineWidth',lw);
xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('fibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-fib-ran'], '-depsc', '-r300')
print([path 'brc961-fib-ran'], '-dpng', '-r300')

%%
figure
lw = 2;
spec = csvread('brc961-mnf16-bas-nor-fin-lym-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('lymphocytes', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-lym-ran'], '-depsc', '-r300')
print([path 'brc961-lym-ran'], '-dpng', '-r300')

%%
figure
lw = 2;
fs = 20;
spec = csvread('brc961-mnf16-bas-nor-fin-nec-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('necrosis', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-nec-ran'], '-depsc', '-r300')
print([path 'brc961-nec-ran'], '-dpng', '-r300')

%%
figure
spec = csvread('brc961-mnf16-bas-nor-fin-myo-spec');
plot(s.wavelength, spec, 'LineWidth',lw);

xlim(gca, [min(s.wavelength) max(s.wavelength)])
ylim(gca,[-0.2 1.1])
xlabel('\textbf{Wavenumber (\boldmath$cm^{-1}$)}','Interpreter','latex','fontweight','bold') 
ylabel(gca,'\textbf{Absorbance}','Interpreter','latex','fontweight','bold') 
set(gca,'FontSize',fs,'fontweight','bold')
h_legend = legend('myofibroblasts', 'Location', 'Best');
set(h_legend,'FontSize',fs, 'fontweight','bold')
grid on
set(gca,'LooseInset',get(gca,'TightInset'));
print([path 'brc961-myof-ran'], '-depsc', '-r300')
print([path 'brc961-myof-ran'], '-dpng', '-r300')


