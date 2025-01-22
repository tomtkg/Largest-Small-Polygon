function saveimage(X, name)
    figure('Position', [0 0 150 150], 'Visible', 'off');
    set(gca,'Fontname','Times New Roman','FontSize',10,'NextPlot','add', ...
        'Color','w','Box','on','LooseInset',get(gca,'TightInset'));

    axis square; grid on;
    xlim([-.52 .52]); xticks(-.5 : .1 : .5);
    ylim([-.52 .52]); yticks(-.5 : .1 : .5);
    
    n = height(X);
    G = graph(1:n, [2:n 1]);
    p = plot(G, 'XData', X(:,1), 'YData', X(:,2), 'NodeLabel', {});
    s = scatter(X(:,1), X(:,2), 'r', 'filled');
    exportgraphics(gcf, sprintf(['image/' name '-1.png'], n));
    delete([p s]);

    G = graph(ones(n), 'omitselfloops');
    plot(G, 'XData', X(:,1), 'YData', X(:,2), 'NodeLabel', {}, ...
        'EdgeColor', '#0072BD', 'EdgeLabel', round(pdist(X), 3), ...
        'EdgeLabelColor', 'b', 'Interpreter', 'latex');
    scatter(X(:,1), X(:,2), 'r', 'filled');
    exportgraphics(gcf, sprintf(['image/' name '-2.png'], n));
    close;
end
