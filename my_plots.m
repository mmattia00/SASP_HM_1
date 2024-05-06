function my_plots(DOAs)

    
    figure;
    plot(DOAs);
    
    
    figure;
    imagesc(p);
    
    % Create a line with 16 equispaced points
    x = linspace(-5, 5, 16);
    y = zeros(size(x)); % Y-coordinate is zero to keep the line straight
    
    % Draw the line with dots
    figure;
    plot(x, y, 'o'); 
    
    % Add an arrow indicating a specific direction
    hold on;
    quiver(0, 0, 0, 5, 'r'); 
    hold off;
    
    % Customize the plot
    title('DOA estimated by the sixteen mics at a fixed instant');
    xlabel('X');
    ylabel('Y');
    axis equal; 
    grid on; 
    
    % Fix the y-axis
    ylim([0, 15]); 
    xlim([-10,10]);


end