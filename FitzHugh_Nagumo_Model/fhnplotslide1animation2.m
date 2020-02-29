%time integration
tspan = [0 560];
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

%background colors
set(gca,'Color', background_tan_color);

%plot(t,y(:,1),'-', 'LineWidth', 2.5, 'Color', green_color)
%plot(t,y(:,2),'-', 'LineWidth', 2.5, 'Color', red_color)


%ANIMATIONNN!

t1 = t;
y2 = y(:,1);
y1 = y(:,1);

curve = animatedline('Color', green_color, 'LineWidth', 2.5);

xlim([0 560]) 
ylim([-0.5 1])

video = VideoWriter('video1b.avi', 'MPEG-4');
open(video)

for i = 1:length(y(:,1))
    addpoints(curve, t(i), y1(i));
    head = scatter(t(i), y1(i), 'filled', 'MarkerFaceColor', background_tan_color, 'MarkerEdgeColor', green_color);
    drawnow
    pause(0.0001)
    
    currframe = getframe;
    writeVideo(video,currframe);
    delete(head);
end

close(video)









