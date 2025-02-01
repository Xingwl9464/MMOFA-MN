function f = SYM_PART_simple(X)
a = 1;
b = 10;
c = 8;

temp_t1 = sign(X(1)) * ceil((abs(X(1)) - (a + c / 2))/(2 * a + c));
temp_t2 = sign(X(2)) * ceil((abs(X(2)) - b / 2)/b);

t1 = sign(temp_t1) * min(abs(temp_t1), 1);
t2 = sign(temp_t2) * min(abs(temp_t2), 1);

p1 = X(1) - t1 * (c + 2 * a);
p2 = X(2) - t2 * b;

f(:, 1) = (p1 + a)^2 + p2^2;
f(:, 2) = (p1 - a)^2 + p2^2;

end
