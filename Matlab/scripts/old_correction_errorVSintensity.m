sensor = {'utm'};
location = {'indoor'};
%plate = {'alu', 'board', 'steel', 'iron'};
plate = {'alu'};
%dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
dist = { 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
colors = {'k', 'b', 'm', 'r', 'g'};

%figure
all_incidense = [];
all_intensity = [];
all_d = [];
all_error = [];
%hold on
for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            intensity = [];
            incidence = [];
            error = [];
            d = [];
            for m = 1:length(dist)
                if isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
                    %incidence = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc;
                    d = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d;
                    f = d > 0.95 & d < 1.2;
                    %f = incidence < 0.4;
                    %incidence = [incidence; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc(f)];
                    incidence = [incidence; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.lon(f)];
                    intensity = [intensity; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int(f)];
                    %d = [d; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d(f)];
                    error = [error; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_d(f)];

                    all_incidense = [all_incidense; incidence];
                    all_intensity = [all_intensity; intensity];
                    all_d = [all_d; d];
                    all_error = [all_error; error]; 
                end
            end
            %error = smooth(intensity, error, 500);
            %error = smooth(d, error, 0.5);
            %plot(intensity, error, '.', 'Color', colors{k})
            %plot(d, error, '.', 'Color', colors{k})
            %xlim([0, 1.4])
        end
    end
end
%hold off

%[x_hat, y_hat, w] = statsPerBin(all_d, all_error, 80);
%[x_hat, y_hat, w] = statsPerBin(all_intensity, all_error, 80);
[x_hat, y_hat, w] = statsPerBin(all_incidense, all_intensity, 60);
% plot(x_hat, y_hat); added by curiosity
i = x_hat(:,2);
e_med = y_hat(:,2);

%% Correction for UTM

depth_corr_simple = 0.035.*exp(-((i-2000)./1000).^2)+2.401e-10*(i.^2)-0.02;
depth_corr = 0.016.*exp(-((i-1277)./197).^2)+0.045*exp(-((i-2523)./1710).^2)+3.181e-06.*i-0.03;

% Correction (one Gaussian)
% f(x) = 0.035*exp(-((x-2000)/1000)^2)+2.401e-10*(x^2)+-0.02
% Coefficients (with 95% confidence bounds):
%        a =       0.035  (-239, 239)
%        a2 =   2.401e-10  (2.113e-10, 2.688e-10)
%        b =        2000  (-3.034e+06, 3.038e+06)
%        c =        1000  (-6.723e+05, 6.743e+05)
%        d =       -0.02  (-0.02311, -0.01689)

% Two Gaussian:
% f(x) = 0.016.*exp(-((x-1277)./197).^2)+0.045*exp(-((x-2523)./1710).^2)+3.181e-06.*x-0.03
% Coefficients (with 95% confidence bounds):
%        a =       0.016  (0.005941, 0.02606)
%        a2 =   3.181e-06  (2.661e-06, 3.702e-06)
%        a3 =     0.04523  (0.04026, 0.0502)
%        d =    -0.02906  (-0.03451, -0.02362)
%        s1 =       196.8  (54.66, 339)
%        s2 =        1710  (1463, 1958)
%        u1 =        1277  (1176, 1378)
%        u2 =        2523  (2388, 2657)

%%
figure
subplot(5,1,1:3)
plot(x_hat, y_hat, '--')
hold on
%plot(x_hat, depth_corr, '.-')

subplot(5,1,4)
plot(x_hat(:,1), y_hat(:,3)-y_hat(:,1), 'k-')

subplot(5,1,5)
bar(x_hat(:,2), w)





%% Correction results

% corrected indoor:
% mean: 0.0049 m  std: 0.0221 m

% normal indoor:
% mean: 0.0232 m  std: 0.0262 m

