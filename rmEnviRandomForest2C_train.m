% function [RF]= rmEnviRandomForest2C_train(EnviFileName, EnviHeaderName, RoiImages, FeatureIndx)
function [RF]= rmEnviRandomForest2C_train(F_t, T_t, ~, FeatureIndx)
%Creates a 2-class random forest classifier for an Envi BIP file using the 
%provided ROI images.  The resulting classifier uses regression to map
%class A to 1 and class B to 0.  This allows the creation of ROC curves.
%
%   EnviFilename - Name of an ENVI BIP file
%   RoiImages - Cell array containing names of ROI images (masks)
 

% %default parameters
% maxPixels = 200000;
threshold = 0.5;
nTrees = 100;
nThreads = 12;
% % 
% % %determine the number of classes
% nClasses = length(RoiImages);
% 
% %for each class, load the training data
% T = [];
% F = [];
%  
% for c = 1:nClasses    
%     
% %load the class mask
%     maskImage = imread(RoiImages{c});
%     maskBinary = (maskImage(:, :, 1) > 0)';
%    
%     disp('------------------------------------------------------');
%     disp(['Loading Training Class ' num2str(c) ' pixels: ' EnviFileName]);
%  
%  %load the class spectra
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

%clean the loaded testing data (remove zero, NaN pixels and troublesome feature bands (for GA))
% [F_t, T_t, ~, Kf] = Spectra_Cleanup(F, T);
% 
% F_t =F;
% T_t = T;
%
% [COEFF,SCORE] = princomp(F_t);
% F_t1 = SCORE(:,10);
if nargin == 4
    %Dimensionality reduction using only few features selected from genetic algorithm (GA)
    %here FeatureIndx is indices of GA selected features i.e.Best_chromosome of
    %GA result 
        F_t = F_t(:,FeatureIndx);
        
end
%%
%parallelize if specified
if nThreads > 1
    parpool('local', nThreads);
    paraoptions = statset('UseParallel', 'always');
end
 
%
%train the classifier
disp('Creating a Random Forest classifier...');
tTrainTime = tic;
RF = TreeBagger(nTrees, F_t, T_t,'method','classification','options',paraoptions);
disp(['Time: ' num2str(toc(tTrainTime)) 's']);


if nThreads > 1
    delete(gcp)
end