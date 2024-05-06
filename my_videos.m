
function my_videos(DOAs)

    % Create a line with 16 equispaced points
    x = linspace(-5, 5, 16);
    y = zeros(size(x)); % Y-coordinate is zero to keep the line straight
    
    % Initialize the video
    video = VideoWriter('arrow_animation.avi', 'Motion JPEG AVI');
    open(video);
    
    % Draw the first frame
    figure;
    plot(x, y, 'o'); 
    hold on;
    arrow = quiver(0, 0, 1, 0, 'r');
    hold off;
    
    title('Animation of the DOAs estimation for each time instant');
    xlabel('X');
    ylabel('Y');
    axis equal; 
    grid on; 
    
    % Fix the y-axis
    ylim([0, 15]); 
    xlim([-10,10]);
    
    % Create the animation
    angles = deg2rad(DOAs + 90);
    for i = 1:length(angles)
        % Calculate the new x and y components of the arrow using the current angle
        dx = 5*cos(angles(i));
        dy = 5*sin(angles(i));
        
        % Update the arrow in the plot
        set(arrow, 'UData', dx, 'VData', dy);
        
        % Add the frame to the video
        frame = getframe(gcf);
        writeVideo(video, frame);
        
        % Pause for animation timing control
        pause(0.01);
    end
    
    % Close the video
    close(video);

end
