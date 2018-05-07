function rtsSaveRAW(data, filename, type, endian)
%Loads a RAW image file.
%LoadRAW(filename, x, y, z, c, type) returns a [CxXxYxZ] array representing
%RAW data loaded from disk. 'type' defines the data type to be loaded (ex.
%'uint8'. 'endian' defines the byte order: 'b' = big endian, 'l' = little
%endian.

file_id = fopen(filename, 'w', endian);
vol = zeros(size(data, 1), size(data, 2), size(data, 3), size(data, 4));
vol(:) = fwrite(file_id, data, type);
fclose(file_id);