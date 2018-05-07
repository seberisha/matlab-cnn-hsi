function [image, header] = rtsEnviLoadImage(filename, headername)
%enter the file name (no .hdr extension)

header_file = headername;
header = rtsEnviLoadHeader(header_file);

if strcmp(header.interleave, 'bsq') == 1
    image = zeros(header.samples, header.lines, header.bands);
end
if strcmp(header.interleave, 'bip') == 1
    image = zeros(header.bands, header.samples, header.lines);
end
if strcmp(header.interleave, 'bil') == 1
    image = zeros(header.samples, header.bands, header.lines);
end


file_bytes = header.samples*header.lines*header.bands;
%check to make sure there is enough memory available
if ispc
    [~, sys] = memory;
    if sys.PhysicalMemory.Available < file_bytes*header.data_type && strcmp(header.interleave, 'bsq') == 0
        strResponse = input('The data set will require virtual memory for permutation. Continue? (y/n) ', 's');
        if strcmp(strResponse, 'n') == 1
            return;
        end
    end
else
    disp('Sorry, I can''t check available memory for this OS.  Keep your fingers crossed!');
end

fid = fopen(filename);
%skip the header - start reading header_offset bytes from the beginning
fseek(fid, header.header_offset, 'bof');

%read the data
image(:) = fread(fid, file_bytes, 'float32');

if strcmp(header.interleave, 'bip') == 1
    image = permute(image, [2 3 1]);
end
if strcmp(header.interleave, 'bil') == 1
    image = permute(image, [1 3 2]);
end