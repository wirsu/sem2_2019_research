%time integration
tspan = [0 140];
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
gray_color = [64,64,64]/255;
white_color = [255,255,255]/255;



hold on 

%background colors
set(gca,'Color', background_tan_color);

%plotting nucline
b = linspace(-0.9, 1.4);
a = -b.*(b - alpha).*(b - 1) + i ;
plot(b, a, 'LineStyle', '--', 'Color', green_color, 'LineWidth', 2.25)
%plotting other nucline
c =  b/gamma;
plot(b, c, 'LineStyle', '--', 'Color', red_color', 'LineWidth', 2.25)

%plot trajectories 
%plot( y(:,1), y(:,2), 'LineWidth', 2.5, 'Color', green_color)

%finding equilibrium points
p = [-1 alpha+1 -(alpha+1) i];
r = roots(p);


%ANIMATIONNN!

y2 = y(:,2);
y1 = y(:,1);
curve = animatedline('Color', gray_color, 'LineWidth', 2.5);

xlim([-0.7 1.3]) 
ylim([0.0 0.30])

video = VideoWriter('video1a.avi', 'MPEG-4');
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









