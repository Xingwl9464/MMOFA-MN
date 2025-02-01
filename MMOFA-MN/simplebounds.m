function position = simplebounds(position, Lb, Ub, center, R)
% Apply the lower bound
ns_tmp = position;
I = ns_tmp < Lb;
ns_tmp(I) = Lb(I);
% Apply the upper bounds
J = ns_tmp > Ub;
ns_tmp(J) = Ub(J);
% Update this new move
position = ns_tmp;

if R ~= inf
    r = sqrt(sum((position(1, :) - center(1, :)).^2));

    if r > R
        position(1, :) = position(1, :) + (1 - (R / r) ) * (center - position(1, :));
    end
end
end