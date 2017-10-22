function M = tukeywin2(w_size, L)
%% generates 2D Tukey (tapered cosine) window with size of L, and padded it to the size of w_size with zeros.
r = w_size(1);
c = w_size(2);

x = tukeywin(L);
x = padarray(x, floor((c - L)/2), 0, 'pre');
x = padarray(x, ceil((c - L)/2), 0, 'post');

y = tukeywin(L);
y = padarray(y, floor((r - L)/2), 0, 'pre');
y = padarray(y, ceil((r - L)/2), 0, 'post');

[xx, yy] = meshgrid(x,y);
M = xx .* yy;

end

