function main()
    %% Largest Small Polygon (LSP)
    for n = 3 : 10
        X = LSP(n);
        name = sprintf('LSP(%d)', n);
        output(X, name);
    end

    %% Regular Polygon
    for n = 3 : 10
        theta = (1 : n) * 2*pi/n;
        X = [sin(theta)' cos(theta)'] / 2;
        X = X / max(pdist(X));          % Scaling
        X = X - [0, max(X(:,2)) - 0.5]; % Moving
        name = sprintf('Regular_polygon(%d)', n);
        output(X, name);
    end

    %% Quadrilaterals
    output([0 .5; -.5 0; 0 -.5; .5 0], 'LSP(4)_square');
    output([0 .5; -.5 .2; 0 -.5; .5 .2], 'LSP(4)_kite');
    output([.2 .5; -.5 .2; .2 -.5; .5 .2], 'LSP(4)_orthodiagonal_trapezoid');
    output([.1 .5; -.5 .2; .1 -.5; .5 .2], 'LSP(4)_orthodiagonal_quadrilateral');
end

function output(X, name)
    fprintf('%s: %.8f\n', name, polyarea(X(:,1), X(:,2)));
    writematrix(X, ['data/' name '.dat'], 'Delimiter', '\t');
    saveimage(X, name);
end
