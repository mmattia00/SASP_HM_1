function my_plots(DOAs, p, times)

    % each times is randomly chosen a different DOA and its related time instant
    random_idx = randi(length(times));
    random_instant = times(random_idx);
    random_DOA = DOAs(random_idx) + 90;
    formatted_instant = sprintf('%.2f', random_instant);

    % plotting DOAS at different time instants
    figure;
    plot(DOAs);
    title('DOAS at different time instants');
    xlabel('time (in samples)');
    ylabel('angles (in degrees)');
    
    
    % plotting averaged pseudospectrum at different time instants
    figure;
    x_values = 1:size(p,2);
    y_values = linspace(-90, 90, size(p, 1));
    imagesc(x_values, y_values, abs(p));
    title('Averaged pseudospectrum at different time instants');
    xlabel('time (in samples)');
    ylabel('angles (in degree)');
    axis xy;
    
    
    
    % Create a line with 16 equispaced points
    x = linspace(-5, 5, 16);
    y = zeros(size(x)); % Y-coordinate is zero to keep the line straight
    
    % Draw the line with dots
    figure;
    plot(x, y, 'o'); 
    
    % Add an arrow indicating a specific direction
    hold on;
    quiver(0, 0, 10*cosd(random_DOA), 10*sind(random_DOA), 'r');
    hold off;
    
    % plotting the DOA estimated by the sixteen mics at a fixed time
    % instant (randomly chosen)
    title(['DOA estimated by the sixteen mics at a fixed time instant of ' formatted_instant 's']);
    xlabel('X');
    ylabel('Y');
    axis equal; 
    grid on; 
    
    % Fix the y-axis
    ylim([0, 15]); 
    xlim([-10,10]);


end