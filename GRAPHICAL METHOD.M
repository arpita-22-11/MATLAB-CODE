 %q:Solve the following LPP using MATLAB 
%z= 3x1+5x2
% constraints: 
%x1+x2<=4
%x1+3x2<6
%x1,x2>=0

clc; clear; close all;

% Coefficients of constraints
% x1 + x2 <= 4
% x1 + 3x2 <= 6
x1 = 0:0.1:6; % range for x1

% Constraint lines
x2_line1 = 4 - x1;       % from x1 + x2 = 4
x2_line2 = (6 - x1)/3;   % from x1 + 3x2 = 6

% Make sure x2 is not negative
x2_line1(x2_line1<0) = NaN;
x2_line2(x2_line2<0) = NaN;

% Plot the constraints
figure;
plot(x1, x2_line1, 'r', 'LineWidth', 2); hold on;
plot(x1, x2_line2, 'b', 'LineWidth', 2);

xlabel('x1'); ylabel('x2');
title('Graphical Solution of LPP');
legend('x1 + x2 = 4','x1 + 3x2 = 6','Location','northeast');
grid on;

% Shade feasible region manually
% Find intersection points (corner points)
A = [1 1; 1 3];
B = [4; 6];
corner_point = A\B; % intersection of both lines

% Other corner points (with axes)
P1 = [0,0];
P2 = [0, min(4,6/3)];
P3 = [min(4,6), 0];
P4 = corner_point';

% Collect feasible points
points = [P1; P2; P4; P3];

% Fill feasible region
patch(points(:,1), points(:,2), 'g', 'FaceAlpha', 0.2);

% Calculate Z = 3x1 + 5x2 for each point
Z = 3*points(:,1) + 5*points(:,2);

% Display results
fprintf('Corner Points and Z values:\n');
for i = 1:size(points,1)
    fprintf('Point (%.2f, %.2f): Z = %.2f\n', points(i,1), points(i,2), Z(i));
end

% Find optimal solution
[maxZ, idx] = max(Z);
fprintf('\nOptimal Solution:\n');
fprintf('x1 = %.2f, x2 = %.2f, Maximum Z = %.2f\n', points(idx,1), points(idx,2), maxZ);

% Mark optimal point on plot
plot(points(idx,1), points(idx,2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
text(points(idx,1)+0.1, points(idx,2), 'Optimal Point', 'FontWeight','bold');
