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
        X = 0.5 * [sin(theta)' cos(theta)'];
        X = X / max(pdist(X));               % Scaling
        X(:,2) = X(:,2) - max(X(:,2)) + 0.5; % Moving
        name = sprintf('Regular_polygon(%d)', n);
        output(X, name);
    end

    %% Quadrilaterals
    output([.0 .5; .5 .0; .0 -.5; -.5 .0], 'LSP(4)_square');
    output([.0 .5; .5 .2; .0 -.5; -.5 .2], 'LSP(4)_kite');
    output([.2 .5; .5 .2; .2 -.5; -.5 .2], 'LSP(4)_orthodiagonal_trapezoid');
    output([.1 .5; .5 .2; .1 -.5; -.5 .2], 'LSP(4)_orthodiagonal_quadrilateral');

    %% LSP(6) Graham's Biggest Little Hexagon with one variable
    GBLH();
end

function output(X, name)
    fprintf('%s: %.8f\n', name, polyarea(X(:,1), X(:,2)));
    writematrix(X, ['data/' name '.dat'], 'Delimiter', '\t');
    saveimage(X, name);
end

function GBLH()
% LSP(6) Graham's Biggest Little Hexagon with one variable

    d = 0 : 0.001 : 0.5;
    A = d;
    for i = 1 : numel(d)
        x = d(i);
        y1 = 0.5 - sqrt(1 - x^2);
        y2 = y1 + sqrt(1 - (0.5 + x)^2);

        X = [0.0 0.5 x 0.0 -x -0.5; 0.5 y2 y1 -0.5 y1 y2]';
        A(i) = polyarea(X(:,1), X(:,2));

        if mod(x, 0.1) == 0
            name = sprintf('GBLH-(%d)', 10 * x);
            output(X, name);
        end
    end
    set(gca,'Fontname','Times New Roman');
    plot(d, A); xlim([-0.005 0.505]); grid on;
    exportgraphics(gcf, 'image/GBLH.png');
    close;
end
