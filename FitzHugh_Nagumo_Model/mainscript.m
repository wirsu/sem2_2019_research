tspan = [0 1000];
y0 = [-0.130601761327204,0.0172109165905210,0.0100687212954356];
%y0 = [0; 0.01;-0.03];

[t,y] = ode45(@main2, tspan, y0);

hold on 
green_color = [10,228,176]/255;
gray_color = [46,53,63]/255;
red_color = [192,0,0]/255;
tan_color = [255,230,153]/255;
newgreen_color = [139,193,103]/255;
blue_color = [32, 56, 100]/255;
solution2_color = [0,176,80]/255;

%p = plot(t,y(:,1), 'Color', blue_color, 'LineWidth', 1.5);
%xlabel('Time (t)')
%ylabel('x')
%plot(t,y(:,2),'--')
%plot(y(:,3), y(:,1), 'Color', red_color, 'LineWidth', 1);
%plot(t,y(:,1),'-')
%p(1).LineWidth = 1.0;

%{%
epsi2 = zeros(1737,1);

for i = 1:1737
    epsi2(i) = 0.003;
end

[t2,y2] = ode45(@main2, tspan, y0);
figure(2)
hold on 
plot3(epsi2,  y(:,3), y(:,1), 'Color', solution2_color, 'LineWidth', 1);
%}

%xlim([-0.1 0.15])
%ylim([-0.35 1.65])

%set(gca,'Color', gray_color);
%ylim([-0.5 2.1])
%title('Solution of Model with ODE45');
%xlabel('Time t');
%ylabel('Solution y');

%xlabel('z');
%ylabel('x');
%legend('y_1','y_2', 'y_3')


%ANIMATIONNN!
%{
y3 = y(:,3);
y1 = y(:,1);
curve = animatedline('Color', tan_color, 'LineWidth', 3);

xlim([-0.1 0.5])
ylim([-0.5 1.8])

%xlim([-0.07 0.08])
%ylim([-0.5 1.4])

video = VideoWriter('video1a.avi', 'MPEG-4');
open(video)

for i = 1:length(y(:,3))
    addpoints(curve, y3(i), y1(i));
    head = scatter(y3(i), y1(i), 'filled', 'MarkerFaceColor', gray_color, 'MarkerEdgeColor', tan_color);
    drawnow
    pause(0.0001)
    
    currframe = getframe;
    writeVideo(video,currframe);
    delete(head);
end

close(video)
%}

