
%filename = './data/laserSpecs.csv'; % data for CARPI paper
%filename = '/Users/francoispomerleau/Research/Sensors/laserSpecs.csv';

spec = textscan(fopen(filename), repmat('%s%s',1,41), 'Delimiter', ',');

h = figure; 
hold on
compagny = {};
unique_compagny = {};
name = {};
maxRange = [];
weight = [];
maxAccuracy = [];
for i = 2:length(spec)
    row = spec{i};
    if ~strcmp(row(1), '') && ~strcmp(row(6), '') && ~strcmp(row(16), '') %&& ~strcmp(row(7), '')
        compagny{end+1} = row(1);
        name{end+1} = row(2);
        maxRange(end+1) = str2num(row{6});
        weight(end+1) = str2num(row{16});
        %maxAccuracy(end+1) = str2num(row{7});
        %text(maxRange(end), weight(end), ['', name{end}], 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top');
        text(weight(end), maxRange(end), ['', name{end}], 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top');
        %text(maxAccuracy(end), maxRange(end), ['', name{end}], 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top');

        if isempty(unique_compagny)
            unique_compagny(end+1) = row(1);
        else
            toAdd = true;
            for j = 1:length(unique_compagny)
                if strcmp(unique_compagny{j}, row(1))
                    toAdd = false;
                end
            end
            if toAdd
                unique_compagny{end+1} = row(1);
            end
        end
        
    end
end

%%
plot(weight, maxRange, '.')
set(gca, 'yScale', 'log')
set(gca, 'xScale', 'log')
set(gca, 'xTickLabel', {0.1, 1, 10, 100})
set(gca, 'yTickLabel', {1, 10, 100, 1000, 10000})

ylabel('Maximum range (m)')
xlabel('Weight (kg)')
set(gcf, 'Position', [624.0000  436.0000  252.0000  310.4000])
%% Save for article
%saveFigArticle(gcf, [], 'copyFigure', false);
%%
%saveFigArticle(gcf, '../article/figures/sensorSpec.eps','copyFigure', false);
%delete('../article/figures/sensorSpec.pdf')

%% Save for thesis
%set(gcf, 'Position', [498.4000  364.8000  538.4000  308.0000]);
%saveFigArticle(gcf, [], 'copyFigure', false, 'columnWidth', 383);
%%
%saveFigArticle(gcf, '../../../../../Thesis/redaction/fig/formalizationICP/sensorSpec.eps', 'columnWidth', 383);
%delete('../../../../../Thesis/redaction/fig/formalizationICP/sensorSpec.pdf')


%%

plot(maxAccuracy, maxRange, '.')
set(gca, 'yScale', 'log')
set(gca, 'xScale', 'log')
%set(gca, 'xTickLabel', {0.1, 1, 10, 100})
%set(gca, 'yTickLabel', {1, 10, 100, 1000, 10000})

ylabel('Maximum range (m)')
xlabel('Maximum accuracy (m)')


