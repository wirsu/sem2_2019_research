


hold on 
plot(i_steady_state_stable, v_steady_state_stable, 'LineWidth', 2.5, 'Color', green_color, 'LineStyle', '--' )
plot(i_steady_state_unstable, v_steady_state_unstable, 'LineWidth', 2.5, 'Color', green_color)

plot(i_period_stable, v_period_stable_max, 'LineWidth', 2.5, 'Color', red_color)

set(gca,'Color', background_tan_color);

xlim([0.055 0.062]) 
ylim([0.0 1])


%{

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


%plotting
%colors:
background_tan_color = [255,240,197]/255;
red_color = [255,0,102]/255;
green_color = [51,204,204]/255;




hold on 
%plot(t,y(:,1),'-', 'LineWidth', 2.5, 'Color', green_color)
%plot(t,y(:,2),'-', 'LineWidth', 2.5, 'Color', red_color)


%background colors
set(gca,'Color', background_tan_color);

%plotting nucline
b = linspace(-0.9, 1.4);
a = -b.*(b - alpha).*(b - 1) + i ;
plot(b, a, 'LineStyle', '--', 'Color', green_color, 'LineWidth', 2.25)
%plotting other nucline
c =  b/gamma;
plot(b, c, 'LineStyle', '--', 'Color', red_color', 'LineWidth', 2.25)

xlim([-1 1.5]) 
ylim([-0.1 0.4])



%ANIMATIONNN!

y2 = y(:,2);
y1 = y(:,1);
curve = animatedline('Color', gray_color, 'LineWidth', 2.5);

xlim([-0.7 1.3]) 
ylim([0.0 0.30])

video = VideoWriter('video2a.avi', 'MPEG-4');
open(video)

for i = 1:length(y(:,2))
    addpoints(curve, y1(i), y2(i));
    head = scatter(y1(i), y2(i), 'filled', 'MarkerFaceColor', background_tan_color, 'MarkerEdgeColor', gray_color);
    drawnow
    pause(0.0001)
    
    currframe = getframe;
    writeVideo(video,currframe);
    delete(head);
end

close(video)


%}





