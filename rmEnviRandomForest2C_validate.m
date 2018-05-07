% function [Croc, Cauc] = rmEnviRandomForest2C_validate(RF, EnviFileName, EnviHeaderName, RoiImages, FeatureIndx)
%function [Tpost, Cauc] = rmEnviRandomForest2C_validate(RF, F_v, T_v)
function [Overall_accuracy, ConfusionMtx] = rmEnviRandomForest2C_validate(RF, F_v, T_v)
%Validates a 2-class random forest classifier, creating ROC curves.

%parameters
% maxPixels = 70000;
% %determine the number of classes
% nClasses = length(RoiImages);
% % make sure that there are only two classes
% if nClasses > 2
%     disp('This classifier only supports 2 classes.');
%     return;
% end

% % for each class, load the validation data
% T = [];
% F = [];
%  
% for c = 1:nClasses
%     
%     %load the class mask
%     maskImage = imread(RoiImages{c});
%     maskBinary = (maskImage(:, :, 1) > 0)';          
%     
%     disp('------------------------------------------------------'); 
%     disp(['Loading Validation Class ' num2str(c) ' pixels: ' EnviFileName]);
%     
%     tLoadTime = tic;
%     fid = rtsEnviOpen(EnviFileName, EnviHeaderName, maskBinary);
%     Fc = (rtsEnviRead(fid, maxPixels))';
%     rtsEnviClose(fid);
%         
%     if c == 1
%         Tc = ones(size(Fc, 1), 1);
%     else
%         Tc = zeros(size(Fc, 1), 1);
%     end
%     
%     disp(['Time: ' num2str(toc(tLoadTime)) 's']);
%     
%     %add features and targets to the final vectors
%     T = [T; Tc];
%     F = [F; Fc];  
% end
% 
% %clean the loaded testing data (remove zero, NaN pixels and troublesome feature bands (for GA))
% [F_v, T_v, ~, Kf] = Spectra_Cleanup(F, T);


% %%
% [COEFF,SCORE] = princomp(F_v);
% F_v1 = SCORE(:,1);
% if nargin == 5
%     %Dimensionality reduction using only few features selected from genetic algorithm (GA)
%     %here FeatureIndx is indices of GA selected features i.e.Best_chromosome of
%     %GA result 
%         F_v1 = F_v(:, FeatureIndx);
%         
% end


%classify the data (get the estimated posterior probability)
disp('Validating...');
tClassTime = tic;
Tpost = predict(RF, F_v);
disp(['Time: ' num2str(toc(tClassTime)) 's']); 

%validatiuon results in confusion matrix
c = unique(T_v);
[ConfusionMtx,order] = confusionmat(T_v, str2double(Tpost));
Overall_accuracy = trace(ConfusionMtx)/sum(sum(ConfusionMtx));

%Tpost=double(cell2mat(Tpost));%for classification method of randomforest convert cell type to double

%calculate and display the ROC curve
% disp('Calculating ROC...');
% tRocTime = tic;
% [Croc, Cauc, threshList] = rtsROC(Tpost, T_v);
% disp(['Time: ' num2str(toc(tRocTime)) 's']);
% disp(['AUC = ' num2str(Cauc)]);
% plot(Croc(:, 1), Croc(:, 2));
