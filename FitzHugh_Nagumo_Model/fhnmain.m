%time integration
tspan = [0 400];
%initial condition
y0 = [0.4; 0.2];


% intial condition used for slide 1. periodic for i = 0.059, t = 140
%y0 = [-0.0770238654960180; 0.0686435099205534];

%parameters
alpha = 0.1;
gamma = 1;
epsilon = 0.01;
%i = 0.059;
%i = 0.058;
i = 0.05;
%i = 0.04;
[t,y] = ode45(@(t,y) fhn(t, y, alpha, gamma, epsilon, i), tspan, y0);

hold on 


plot(t,y(:,1),'-',t,y(:,2),'-', 'LineWidth', 2.5)

%{
%plotting nucline
b = linspace(-0.9, 1.4);
a = -b.*(b - alpha).*(b - 1) + i ;
plot(b, a, 'LineStyle', '--')
%plotting other nucline
c =  b/gamma;
plot(b, c, 'LineStyle', '--')

%plot trajectories 
plot( y(:,1), y(:,2), 'LineWidth', 2)

xlim([-0.7 1.3]) 
ylim([0.0 0.30])


%background colors
%gray_color = [46,53,63]/255;
%set(gca,'Color', gray_color);

%}







