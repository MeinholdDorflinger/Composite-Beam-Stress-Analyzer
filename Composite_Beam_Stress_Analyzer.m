clear;clc;clf;

% Creates zero matrices for necessary variables
shape_number = input('How many rectangles?: ');
BM = input('Enter bending moment: ');         % Other units can be used if consistent, output won't be psi
b = zeros(1, shape_number);                   % Zero matrix for base dimensions   
b_transformed = zeros(1, shape_number);       % Zero matrix for transformed base dimensions       
h = zeros(1, shape_number);                   % Zero matrix for height dimensions    
c = zeros(1, shape_number);                   % Zero matrix for center distance dimensions     
area = zeros(1, shape_number);                % Zero matrix for area dimensions         
e = zeros(1, shape_number);                   % Zero matrix for Modulus of Elasticity dimensions       
x_val = zeros(5, shape_number);               % Zero matrix for real x-values dimensions          
x_val_trans = zeros(5, shape_number);         % Zero matrix for transformed x-values dimensions          
y_val = zeros(5, shape_number);               % Zero matrix for real and transformed y-values dimensions  
stress_top = zeros(1, shape_number);          % Zero matrix for top stresses of each shape
stress_bottom = zeros(1, shape_number);       % Zero matrix for bottom stresses of each shape

% Inputs data into matrices given by user
for i = 1:shape_number
    fprintf('Enter Modulus of Elasticity for shape %d in same units: ', i)
        e(i) = input('');
    fprintf('Enter base %d: ', i);
        b(i) = input(' ');
    fprintf('Enter height %d: ', i);
        h(i) = input('');
    fprintf('Enter center distance from bottom: ');
        c(i) = input('');

end

n = e./min(e);       % Defines ratio of elastic moduli
y_top = c + h/2;     % Defines an array of y-values of top of shape
y_bottom = c - h/2;  % Defines an array of y-values of bottom of shape

for i = 1:shape_number

    b_transformed(i) = n(i)*b(i);      % Transforms base dimensions
    area(i) = b_transformed(i)*h(i);            % Calculates area 

    x_val_trans(1,i) = b_transformed(i)/2;      % These are the transformed x-values
    x_val_trans(2,i) = b_transformed(i)/2;      % that will be plotted 
    x_val_trans(3,i) = -1*b_transformed(i)/2;   
    x_val_trans(4,i) = -1*b_transformed(i)/2;
    x_val_trans(5,i) = b_transformed(i)/2;

    x_val(1,i) = b(i)/2;            % These are the real x-values             
    x_val(2,i) = b(i)/2;            % that will be plotted            
    x_val(3,i) = -1*b(i)/2;
    x_val(4,i) = -1*b(i)/2;
    x_val(5,i) = b(i)/2;

    y_val(1,i) = c(i)-h(i)/2;       % y-values that will be plotted
    y_val(2,i) = c(i)+h(i)/2;
    y_val(3,i) = c(i)+h(i)/2;
    y_val(4,i) = c(i)-h(i)/2;
    y_val(5,i) = c(i)-h(i)/2;

end

% Calculates y_bar and area moment of inertia
y_bar = sum(area(1,:).*c(1,:))/sum(area(:));
AMOI = sum(1/12.*b_transformed(1,:).*h(1,:).^3 + area(1,:).*(c(1,:)-y_bar).^2);


% Calculates and prints top and bottom stresses of each material region
for i = 1:shape_number
    stress_top(i) = n(i)*BM*(y_top(i) - y_bar)/AMOI; 
    stress_bottom(i) = n(i)*BM*(y_bottom(i) - y_bar)/AMOI;

    fprintf('\n Rectangle %d \n', i);
    fprintf('Top Stress: %.2f \n', stress_top(i));
    fprintf('Bottom Stress: %.2f \n', stress_bottom(i));
end

% Finds and prints the max Tension and Compression values
all_stresses = [stress_top stress_bottom];
fprintf('\nMaximum Tension: %.2f \n', max(all_stresses));
fprintf('Maximum Compression: %.2f \n', min(all_stresses));

% Calculates height of rectangle from bottom
true_height = h(1,:)./2 + c(1,:);

% Plots shapes
for i = 1:shape_number
    subplot(2,1,1)
    plot(x_val(:,i),y_val(:,i), 'LineWidth',3); hold on;
    title('Real Cross Section')

    % Defines graph limits based off shapes
    yline(y_bar, "--", 'LineWidth',2);
    xlim([-1*max(b)/2-0.5, max(b)/2+0.5]);
    ylim([-1, max(true_height) + 1]);
    axis equal;
    grid on;

    subplot(2,1,2)
    plot(x_val_trans(:,i),y_val(:,i), 'LineWidth',3); hold on;
    title('Transformed Cross Section')

    % Defines graph limits based off shapes
    yline(y_bar, "--", 'LineWidth',2);
    xlim([-1*max(b)/2-0.5, max(b_transformed)/2+0.5]);
    ylim([-1, max(true_height) + 1]);
    axis equal;
    grid on;
end

