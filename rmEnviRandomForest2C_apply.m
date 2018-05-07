function [ T ]= rmEnviRandomForest2C_apply(RF, EnviFileName, EnviHeaderName, TissueMask,ind_sel)
%Only pixels specified in TissueMask are classified.  The estimated rule data is
%returned as an image sequence.

%load the tissue mask
maxPixels = 1e9;
maskImage = imread(TissueMask);
maskBinary = (maskImage(:, :, 1) > 0)';
nPixels = nnz(maskBinary);
disp(['Number of pixels: ' num2str(nPixels)]);

%load the data
disp(['Loading Features: ' EnviFileName]);
tLoadTime = tic;
fid = rtsEnviOpen(EnviFileName, EnviHeaderName, maskBinary);
F = (rtsEnviRead(fid, maxPixels));
rtsEnviClose(fid);
disp(['Time: ' num2str(toc(tLoadTime)) 's']);
F =F';

%classify the data
disp('Classifying...');
tClassTime = tic;
[T,  Posterior, std] = predict(RF, F);
disp(['Time: ' num2str(toc(tClassTime)) 's']);

%reconstruct the image of classification from the mask
tempP = rtsMaskReconstruct((str2num(cell2mat(T)))', maskBinary, -1);
imagesc(tempP');

%compute the size of response envi image 
nX = size(tempP, 1);
nY = size(tempP, 2);
nV = size(Posterior,2);             %number of values at each pixel(number of classes)
P = zeros(nX, nY, nV+1);

%add first band of response image is classified image
P(:,:,1) = tempP;

%reconstruct the 3d-image of class scores/posterios probabilities/responses of classification from tissue mask
for i = 1: size(Posterior,2)
 tempP= rtsMaskReconstruct((Posterior(:,i))', maskBinary, -1);
 P(:,:,i+1) = tempP;
end

%save envi file off responses
fileName = [EnviFileName 'response'];
headerName = [EnviFileName 'response.hdr'];

W = [0: size(Posterior,2)]                            %get wavelength list of envi file
rtsEnviSaveImage(P, fileName, headerName, W);