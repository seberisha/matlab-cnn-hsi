function EID = rtsEnviOpen(filename, headername, mask)

%opens an ENVI file and returns an ID structure
% filename = name of ENVI file
% headername = name of ENVI header
% FID = structure containing file information
% mask = binary image specifying valid spectra

%assign the mask variable
if(nargin < 3)
    mask = 1;
end

%open the file and save the file ID
fid = fopen(filename, 'r');

%open the ENVI header file
header = enviLoadHeader(headername);

%this is currently only valid for BIP files
if(~strcmp(header.interleave, 'bip'))
    disp('Error: This function only works for BIP interleave files.  Load in ENVI and convert.');
end
if(header.data_type ~= 4)
    disp('Error: This function only works for floating-point files.');
end

EID = enviID;
EID.fid = fid;
EID.header = header;
EID.mask = mask;
EID.fpos = 0;

%EID = struct('fid', fid, 'header', header, 'mask', mask, 'fpos', 0);

