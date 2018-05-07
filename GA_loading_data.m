function [F, Label]= GA_loading_data(EnviFileName, EnviHeaderName, RoiImages)

%Loads data for feature selection using GA-LFDA for an Envi BIP file using the
%provided ROI images.
%
%   EnviFilename - Name of an ENVI BIP file
%   RoiImages - Cell array containing names of ROI images (masks)

% This function retuns the following
%   F       = feature matrix for the entire training set (obs x feat)
%   Label   = class label for each observation (integer index) (column vector)
%   Kf      = indices for values that are "cleaned"

%default parameters
maxPixels =2000000;

%determine the number of classes
nClasses = length(RoiImages);

%for each class, load the training data
Label = [];
F = [];
for c = 1:nClasses
   
%load the class mask
    maskImage = imread(RoiImages{c});
    maskBinary = (maskImage(:, :, 1) > 0)';
   
    disp('------------------------------------------------------');
    disp(['Loading Training Class ' num2str(c) ' pixels: ' EnviFileName]);

%load the class spectra
    tLoadTime = tic;
    fid = enviOpen(EnviFileName, EnviHeaderName, maskBinary);
    Fc = (enviRead(fid, maxPixels))';
    enviClose(fid);
          
%     if c == 1
%         Label_c = ones(size(Fc, 1), 1);
%     else
%         Label_c = zeros(size(Fc, 1), 1);
%     end
   Label_c = c*ones(size(Fc, 1), 1);
   
    disp(['Time: ' num2str(toc(tLoadTime)) 's']);
   
    %add features and targets to the final vectors
    Label = [Label; Label_c];
    F = [F; Fc]; 
end
end
