function per_psp = PSP(PS,position,igdx)


d = numel(position(1, :));
v_max = zeros(1, d);
v_min = zeros(1, d);
V_max = zeros(1, d);
V_min = zeros(1, d);

xn = zeros(1, d);
for i = 1:d
    v_max(i) = max(position(:, i));
    v_min(i) = min(position(:, i));
    V_max(i) = max(PS(:, i));
    V_min(i) = min(PS(:, i));

    if V_max(i) == V_min(i)
        xn(i) = 1;
    elseif v_min(i) >= V_max(i) || v_max(i) <= V_min(i)
        xn(i) = 0;
    else
        xn(i) = ((min(v_max(i), V_max(i)) - max(v_min(i), V_min(i))) / (V_max(i) - V_min(i)))^2;
    end


end
CR = prod(xn)^(1 / (2 * d));
per_psp = CR / igdx;
end