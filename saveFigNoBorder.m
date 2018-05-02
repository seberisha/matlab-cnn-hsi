function saveFigNoBorder(a, h, filename, type, sz)
set(a, 'position', [0 0 1 1], 'units', 'normalized')
%set(a,'LooseInset',get(gca,'TightInset'));
truesize(h,[sz+50 sz+50])

print(filename, type, '-r300')