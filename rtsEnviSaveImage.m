function rtsEnviSaveImage(S, fileName, headerName, W)

%  S = 3D hyperspectral data
%  W = list of wavelength values

%save the image
rtsSaveRAW(S, fileName, 'float32', 'l');

%create the header file
headerFile = [fileName '.hdr'];
if nargin == 3
    headerFile = headerName;
end

fid = fopen(headerFile, 'w');

%write the header and description
fprintf(fid, 'ENVI\n');
fprintf(fid, 'description = {\n');
fprintf(fid, '  File Saved using Matlab.}\n');
fprintf(fid, 'samples = %d\n', size(S, 1));
fprintf(fid, 'lines   = %d\n', size(S, 2));
fprintf(fid, 'bands   = %d\n', size(S, 3));
fprintf(fid, 'header offset = 0\n');
fprintf(fid, 'file type = ENVI Standard\n');
fprintf(fid, 'data type = 4\n');
fprintf(fid, 'interleave = bsq\n');
fprintf(fid, 'sensor type = Unknown\n');
fprintf(fid, 'byte order = 0\n');

if nargin == 4
    %output wavelength units
    fprintf(fid, 'wavelength = {\n');
    for i = 1:length(W)-1
        fprintf(fid, ' %f,\n', W(i));
    end
    fprintf(fid, ' %f\n', W(length(W)));
    fprintf(fid, '}\n');
end

fclose(fid);
