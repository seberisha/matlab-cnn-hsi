function s = rtsEnviLoadHeader(filename)
%create a cell array of fields
s = struct;

fid = fopen(filename, 'r', 'n', 'US-ASCII');

%read the first field and make sure it is "ENVI"
fname = GetFieldName(fid);
if strcmp(fname, 'ENVI') == 0
    disp('Not an ENVI header file');
    return;
end

while feof(fid) == 0
    fname = GetFieldName(fid);
    if feof(fid) == 1
        return;
    end
    [value, valid] = ReadField(fid, fname);
    if valid == 1
        s = setfield(s, fname, value);
    end
end
fclose(fid);

function t = GetFieldName(fid)
string_struct = textscan(fid, '%s', 1, 'Delimiter', '=');
if feof(fid) == 1
    t = [];
    return;
end
t = string_struct{1}{1};
t = strtrim(t);
t(t==' ') = '_';

function [v, valid] = ReadField(fid, field_name)
valid = 1;
stringFields = {'file_type', 'interleave', 'sensor_type', 'wavelength_units'};
intFields = {'samples', 'lines', 'bands', 'header_offset', 'data_type', 'byte_order'};

%if the field is "description", read between the brackets
if strcmp(field_name, 'description') == 1
    textscan(fid, '%[{]', 1);
    string_struct = textscan(fid, '%[^}]', 1, 'Whitespace', '');
    textscan(fid, '%[}]', 1);
    v = string_struct{1}{1};
    v = strtrim(v);
    return;
end
if max(strcmp(field_name, intFields)) ~= 0
    v = fscanf(fid, '%d');
    return;
end
if max(strcmp(field_name, stringFields)) ~= 0
    string_struct = textscan(fid, '%s', 1, 'Whitespace', '\n');
    v = string_struct{1}{1};
    v = strtrim(v);
    return;
end

%read and return the wavelength values
if strcmp(field_name, 'wavelength') == 1
    v = [];
    textscan(fid, '%[{]', 1);
    c = ' ';
    while c ~= '}'
        new = fscanf(fid, '%f');
        v = [v new];
        c = fscanf(fid, '%c', 1);
    end
    return;
end

%if it doesn't match anything, just read until the end of the line
%string_struct = textscan(fid, '%s', 1, 'Whitespace', '\n');
string_struct = textscan(fid, '%s', 1, 'Delimiter', '\n');
v = '';
valid = 0;
