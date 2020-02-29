
%time integration
%tspan = [0 82];
%initial condition
%y0 = [0.4; 0.2];
% intial condition used for slide 1. periodic for i = 0.059, t = 140
%y0 = [-0.0770238654960180; 0.0686435099205534];


%Orbit1
%i = 0.058;
%tspan = [0 82];
%y0 = [0.0532783190526933; 0.0844000089546051];

%Orbit2
i = 0.05835;
tspan = [0 150];
y0 = [-0.0770238654960180; 0.0686435099205534];

%Orbit3
%i = 0.058375;
%tspan = [0 500];
%y0 = [[-0.0264511242191225,0.0566872954757827]];


%Orbit3
%i = 0.058431;
%tspan = [0 150];
%y0 = [-0.0770238654960180; 0.0686435099205534];

%Orbit4
%i = 0.059;
%tspan = [0 150];
%y0 = [-0.0770238654960180; 0.0686435099205534];

%Orbit5
%i = 0.0625;
%tspan = [0 150];
%y0 = [-0.0770238654960180; 0.0686435099205534];



%parameters
alpha = 0.1;
gamma = 1;
epsilon = 0.01;
[t,y] = ode45(@(t,y) fhn(t, y, alpha, gamma, epsilon, i), tspan, y0);

hold on 


%plotting
%colors:
background_tan_color = [255,240,197]/255;
red_color = [255,0,102]/255;
green_color = [51,204,204]/255;

hold on 

%background colors
set(gca,'Color', background_tan_color);

%plotting nucline
b = linspace(-0.9, 1.4);
a = -b.*(b - alpha).*(b - 1) + i ;
%plot(b, a, 'LineStyle', '--', 'Color', green_color, 'LineWidth', 2.25)
%plotting other nucline
c =  b/gamma;
%plot(b, c, 'LineStyle', '--', 'Color', red_color', 'LineWidth', 2.25)

plot(y(:,1), y(:,2), 'LineStyle', '-', 'Color', gray_color, 'LineWidth', 1.5)

xlim([-0.6 1.2]) 
ylim([-0.05 0.35])

