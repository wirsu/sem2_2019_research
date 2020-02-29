function dydt = fhn(t, y, alpha, gamma, epsilon, i)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
dydt = zeros(2,1);

dydt(1) = -y(1)*(y(1) - alpha)*(y(1) - 1) - y(2) + i ;
dydt(2) = epsilon * (y(1) - gamma * y(2));

end

