function S = rtsEnviRead(fid, batchSize)

%This function reads a batch of spectra from the given ENVI file ID
% fid = ENVI file ID created using rtsEnviOpen
% batchSize = number of spectra to read

%if there is no mask, just load each spectrum in order
if(fid.mask == 1)
    
    %compute the new batch size in case we are near the eof
    nSpectra = fid.header.samples * fid.header.lines;
    remainingSpectra = nSpectra - fid.fpos;
    
    if(batchSize > remainingSpectra)
        batchSize = remainingSpectra;
    end
    
    S = fread(fid.fid, [fid.header.bands batchSize], '*float32');

    %increment the fid counter
    fid.fpos = fid.fpos + batchSize;
    
%otherwise only load valid spectra
else
    
    %compute the new batch size in case we are near the eof
    if(fid.fpos == 0)
        remainingSpectra = nnz(fid.mask);
    else
        nSpectra = nnz(fid.mask);
        maskRead = fid.mask(1:fid.fpos+1);
        remainingSpectra = nSpectra - nnz(maskRead);
    end

    if(batchSize > remainingSpectra)
        batchSize = remainingSpectra;
    end
    
    %allocate space for the spectra
    S = zeros(fid.header.bands, batchSize);
    
    %for each spectrum in the batch
    for s = 1:batchSize
        
        %while the current spectrum is invalid
        skip = 0;
        while (~fid.mask(fid.fpos + 1))
            %read the invalid spectrum
            %invalid = fread(fid.fid, [fid.header.bands 1], '*float32');            
            skip = skip + 1;
            
            %increment the file position
            fid.fpos = fid.fpos + 1;
        end
        fseek(fid.fid, skip * fid.header.bands * 4, 'cof');
        
        test = fread(fid.fid, [fid.header.bands 1], '*float32');
        if size(test) ~= size(S(:, s))
            size(test)
            size(S(:, s))
        end
        S(:, s) = test;
        fid.fpos = fid.fpos + 1;
        
    end    
    
end

