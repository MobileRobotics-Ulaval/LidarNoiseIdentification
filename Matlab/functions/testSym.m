syms inc alpha

sensorHalfAngle = 0.0012217;
dist = 2;
inc = 0;
alphaLimit = [-0.00122, 0.00122];

betaAngle = pi/2 - inc;
x = ((dist)*sin(sensorHalfAngle) ./ sin(betaAngle + sensorHalfAngle));
y = (-(dist).*sin(sensorHalfAngle)./sin(betaAngle - sensorHalfAngle));
mu = ((x +y) / 2);
sigma = ((abs(x) + abs(y))/6);

distanceFunction(alpha) = (cos(inc).*(dist))./cos(inc - alpha);
intensityFunction(alpha) = -(distanceFunction(alpha));
backscatterFunction(alpha) = exp(-((alpha-mu).^2)./(2.*sigma.^2)) ./ (sqrt(2*pi).*sigma);

% normalized(x) = ((x - min(x)) ./ max((x - min(x))));

% returnedIntensity(alpha, inc) = normalized(intensityFunction(alpha, inc)) .* normalized(backscatterFunction(alpha, inc));

% in command window : ezplot(backscatterFunction, alphaLimit)