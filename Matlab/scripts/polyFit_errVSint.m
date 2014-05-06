% test cubic spline

allInt = aggregateData('utm','indoor','int');
allErr = aggregateData('utm','indoor','err');

[x, y, w] = statsPerBin(allInt(1:18:end), allErr(1:18:end), 50);

lin = linspace(0,14000,1000);

coeffs = polyfit(allInt, allErr, 8); % 8 est pas pireeee, 15 est good
coeffs2 = polyfit(allInt, allErr, 15);
hold on;
subplot(1,2,1)
plot(allInt(1:10:end), allErr(1:10:end),'.', lin, polyval(coeffs,lin),'-');
title('UTM : error vs intensity')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.08]);
%xlim([0, 14000]);

subplot(1,2,2)
plot(allInt(1:10:end), allErr(1:10:end),'.', lin, polyval(coeffs2,lin),'-');
title('UTM : error vs intensity')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.08]);
%xlim([0, 14000]);

