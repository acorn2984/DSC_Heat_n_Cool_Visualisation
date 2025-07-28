if exist('Ts', 'var')
    fprintf('Temperature range:\n');
    fprintf('  Sample temp: %.2f - %.2f °C\n', min(Ts), max(Ts));
end

clear; clc; close all;

fprintf('DSC Data Plotter\n');
fprintf('================\n');
data_name = input('Enter the data file name (without extension): ', 's');

if ~contains(data_name, '.txt')
    data_name = [data_name '.txt'];
end

if ~isfile(data_name)
    error('File "%s" not found in current directory. Please check the filename.', data_name);
end

try
    fprintf('Reading data from: %s\n', data_name);

    fid = fopen(data_name, 'r');
    if fid == -1
        error('Cannot open file: %s', data_name);
    end

    lines = {};
    line_count = 0;
    data_start = 0;
    
    while ~feof(fid)
        line = fgetl(fid);
        line_count = line_count + 1;

        if ischar(line) && length(line) > 10
            parts = strsplit(strtrim(line));
            if length(parts) >= 5
                if ~isnan(str2double(parts{1})) && data_start == 0
                    data_start = line_count;
                    fprintf('Data starts at line %d\n', data_start);
                end
            end
        end
        
        if data_start > 0
            lines{end+1} = line;
        end
    end
    fclose(fid);

    if isempty(lines)
        error('No numerical data found in file');
    end

    index = [];
    time = [];
    heat_flow = [];
    Ts = [];
    Tr = [];
    
    fprintf('Parsing %d data lines...\n', length(lines));
    
    for i = 1:length(lines)
        parts = strsplit(strtrim(lines{i}));
        if length(parts) >= 5
            try
                index(end+1) = str2double(parts{1});
                time(end+1) = str2double(parts{2});
                heat_flow(end+1) = str2double(parts{3});
                Ts(end+1) = str2double(parts{4});
                Tr(end+1) = str2double(parts{5});
            catch
                fprintf('Warning: Could not parse line %d\n', i);
            end
        end
    end

    if isempty(time) || isempty(heat_flow)
        error('No valid data found. Check file format.');
    end
    
    fprintf('Successfully loaded %d data points\n', length(time));
    fprintf('Time range: %.2f to %.2f seconds\n', min(time), max(time));
    fprintf('Heat flow range: %.6f to %.6f W/g\n', min(heat_flow), max(heat_flow));

    figure('Position', [100, 100, 900, 700]);

    subplot(2, 1, 1);
    time_min = time / 60;
    plot(time_min, heat_flow, 'b-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (min)', 'FontSize', 12);
    ylabel('Heat Flow (W/g)', 'FontSize', 12);
    title(['DSC Isothermal Analysis: ' strrep(data_name, '_', '\_')], 'FontSize', 14, 'FontWeight', 'bold');

    avg_heat_flow = mean(heat_flow);
    min_heat_flow = min(heat_flow);
    max_heat_flow = max(heat_flow);

    if exist('Ts', 'var') && ~isempty(Ts)
        subplot(2, 1, 2);
        plot(Ts, heat_flow, 'r-', 'LineWidth', 1.5);
        grid on;
        xlabel('Sample Temperature (°C)', 'FontSize', 12);
        ylabel('Heat Flow (W/g)', 'FontSize', 12);
        title('Heat Flow vs Sample Temperature', 'FontSize', 12);

        xlim([25, 300]);
        xticks(25:25:300);
        
        grid minor;
    else
        fprintf('Warning: Sample temperature data not available for secondary plot.\n');
    end
    
    fprintf('\n--- Data Summary ---\n');
    fprintf('Total measurement time: %.1f seconds (%.2f minutes)\n', max(time), max(time)/60);
    fprintf('Heat flow statistics:\n');
    fprintf('  Average: %.6f W/g\n', avg_heat_flow);
    fprintf('  Minimum: %.6f W/g\n', min_heat_flow);
    fprintf('  Maximum: %.6f W/g\n', max_heat_flow);
    fprintf('  Standard deviation: %.6f W/g\n', std(heat_flow));
    
    fprintf('\nPlots are now displayed. Press any key to continue...\n');
    pause;
    
    save_plot = input('\nSave plot as PNG? (y/n): ', 's');
    if strcmpi(save_plot, 'y') || strcmpi(save_plot, 'yes')
        plot_filename = strrep(data_name, '.txt', '_plot.png');
        saveas(gcf, plot_filename);
        fprintf('Plot saved as: %s\n', plot_filename);
    end
    
catch ME
    fprintf('Error reading or processing data: %s\n', ME.message);
    fprintf('Please ensure the data file format matches the expected structure.\n');
    fprintf('Expected format: Index, Time(s), HeatFlow(W/g), Ts(°C), Tr(°C)\n');
end

fprintf('\nAnalysis complete!\n');