%%
svm_lm_cm = [[  843     4   134    57   484]
 [   27 78872   256  1077   104]
 [  573   648 73733  1510  9186]
 [  642 53447 45978 56823  4715]
 [ 6197    17  4769    28 42338]];

%% 
class_names = {'blo', 'col', 'epi', 'myo', 'nec'};
disp('CAs for SVM')
for i = 1:size(svm_lm_cm,2)
    fprintf('CA for %s: %0.2f \n', class_names{i}, svm_lm_cm(i,i)/sum(svm_lm_cm(i,:)))
end

%%
cnn_lm_cm = [ 1138           0         338          36          10
              597       75706          59        3974           0
              1510         262       75340        7476        1062
              3137       20572       30922      106974           0
              2875           0        3137         122       47215];
disp('CAs for CNN')
for i = 1:size(cnn_lm_cm,2)
    fprintf('CA for %s: %0.2f \n', class_names{i}, cnn_lm_cm(i,i)/sum(cnn_lm_cm(i,:)))
end