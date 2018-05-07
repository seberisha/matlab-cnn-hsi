function I = rtsMaskReconstruct(data, mask, fillVal)

%This function reconstructs an array of data created from a mask
% data = a VxD matrix, where D = positions and V = values
% mask = a binary image with D nonzero values

%compute the number of values at each pixel
nV = size(data, 1);

%allocate space
nX = size(mask, 1);
nY = size(mask, 2);
I = ones(nV, nX*nY) * fillVal;

d=1;
%for each position
for p = 1:nX*nY
    
    %if the mask value at the position is true, copy values
    if(mask(p) && d < size(data, 2))
        I(:, p) = data(:, d);
        
        %increment the data pointer
        d = d + 1;
        
    %if the mask value at the position is zero, set all values to zero
    else
        I(:, p) = ones(nV, 1) * fillVal;
    end 
    
end

%reshape the array into an image
I = reshape(I', [nX nY nV]);

