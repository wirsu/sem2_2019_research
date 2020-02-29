function dydt = main2(t , y)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
dydt = zeros(3,1);

s = -1.61;
b1 = -0.045;
epsilon = 0.019;

a = 0.5;
b = 1;
a1 = -0.1;
k = 0.2;
phi = 1;

dydt(1) = s * a * y(1)^3 - s * y(1)^2 - y(2) - b * y(3);
dydt(2) = phi * ( y(1)^2 - y(2) );
dydt(3) = epsilon * (s * a1 * y(1) + b1 - k * y(3));
end

