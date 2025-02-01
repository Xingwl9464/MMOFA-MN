function f = Omni_test(X)
f = zeros(2, 1);
n = length(X);
for i = 1:n
    f(1) = f(1) + sin(pi*X(i));
    f(2) = f(2) + cos(pi*X(i));
end
f = f';
end