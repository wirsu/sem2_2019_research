%time integration
tspan = [0 1000];
%initial condition
%y0 = [0.3; 0.3];
y0 = [-0.0770238654960180; 0.0686435099205534];

%parameters
alpha = 0.1;
gamma = 1;
epsilon = 0.01;
i = 0.059;
%i = 0.058;
%i = 0.04;
[t,y] = ode45(@(t,y) fhn(t, y, alpha, gamma, epsilon, i), tspan, y0);

%plotting
%colors:
background_tan_color = [255,240,197]/255;
red_color = [255,0,102]/255;
green_color = [51,204,204]/255;




hold on 
plot(t,y(:,1),'-', 'LineWidth', 2.5, 'Color', green_color)
plot(t,y(:,2),'-', 'LineWidth', 2.5, 'Color', red_color)


%background colors
set(gca,'Color', background_tan_color);
%{
%plotting nucline
b = linspace(-0.9, 1.4);
a = -b.*(b - alpha).*(b - 1) + i ;
plot(b, a, 'LineStyle', '--')
%plotting other nucline
c =  b/gamma;
plot(b, c, 'LineStyle', '--')

%plot trajectories 
plot( y(:,1), y(:,2))

xlim([-1 1.5]) 
ylim([-0.1 0.4])

%finding equilibrium points
p = [-1 alpha+1 -(alpha+1) i];
r = roots(p);
%}










