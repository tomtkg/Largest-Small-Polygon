function X = LSP(n)
    if mod(n, 2)
        update_x = @(x) [0 0.5; x; flipud([-x(:,1) x(:,2)])];
    else
        update_x = @(x) [0 0.5; x; 0 -0.5; flipud([-x(:,1) x(:,2)])];
    end
    
    rng(42);
    d = ceil(n/2-1);
    theta = (1 : d) * 2*pi/n + 0.1*rand(1, d);
    x0 = [sin(theta)' cos(theta)'] / 2;

    lb = -ones(d, 2) / 2;
    ub = ones(d, 2) / 2;
    options = optimoptions('fmincon', 'Display', 'none', ...
        'Algorithm', 'sqp', 'TolFun', 1e-9, 'TolX', 1e-9, ...
        'MaxFunEvals', 1e6, 'MaxIter', 1e6);
    
    x = fmincon(@(x) -polygon_area(x, update_x), x0, [], [], [], [], ...
        lb, ub, @(x) distance_constraints(x, update_x), options);
    
    X = update_x(x);
end

function A = polygon_area(x, update_x)
    X = update_x(x);
    A = polyarea(X(:,1), X(:,2));
end

function [c, ceq] = distance_constraints(x, update_x)
    X = update_x(x);
    c = pdist(X)' - 1;
    ceq = [];
end
