function S = rtsEnviRead(EnviFID, batchSize)

%This function reads a batch of spectra from the given ENVI file ID
% EnviFID = ENVI file ID created using rtsEnviOpen
% batchSize = number of spectra to read

%if there is no mask, just load each spectrum in order
if(EnviFID.mask == 1)
    
    %compute the new batch size in case we are near the eof
    nSpectra = EnviFID.header.samples * EnviFID.header.lines;
    remainingSpectra = nSpectra - EnviFID.fpos;
    
    if(batchSize > remainingSpectra)
        batchSize = remainingSpectra;
    end
    
    S = fread(EnviFID.fid, [EnviFID.header.bands batchSize], '*float32');%size of S is bands*batchsize (sample* lines) reads all spectra of all the pixels

    %increment the EnviFID counter
    EnviFID.fpos = EnviFID.fpos + batchSize;
    
%otherwise only load valid spectra
else
    
    %compute the new batch size in case we are near the eof
    if(EnviFID.fpos == 0)
        disp('br1');
        remainingSpectra = nnz(EnviFID.mask);
    else
        
        nSpectra = nnz(EnviFID.mask);
        maskRead = EnviFID.mask(1:EnviFID.fpos+1);
        remainingSpectra = nSpectra - nnz(maskRead);
    end

    if(batchSize > remainingSpectra)
              batchSize = remainingSpectra;
    end
    
    %allocate space for the spectra
    S = zeros(EnviFID.header.bands, batchSize);
 
    %for each spectrum in the batch
    for s = 1:batchSize
        %while the current spectrum is invalid
        skip = 0;
        while (~EnviFID.mask(EnviFID.fpos + 1))
            %read the invalid spectrum
            %invalid = fread(EnviFID.fid, [EnviFID.header.bands 1], '*float32');            
            skip = skip + 1;
            
            %increment the file position
            EnviFID.fpos = EnviFID.fpos + 1;
        end
        fseek(EnviFID.fid, skip * EnviFID.header.bands * 4, 'cof');
        
        test = fread(EnviFID.fid, [EnviFID.header.bands 1], '*float32');
            %reads 1624*1 spectrum of that pixel
        EnviFID.fpos = EnviFID.fpos + 1;
       

        if size(test) ~= size(S(:, s))%check if read vector is equal to the size of s'th pixel spectum vector of S
            size(test);     
            size(S(:, s));
        else
        S(:, s) = test;
        end
       
    end    
    
end

