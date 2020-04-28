%% Problem1
close all
clear all

%Part b

% Parameters
input = linspace(0.01,15,1000);
kappa = 10; %need to change for 0.1

%Solve x* and y* equations
[theta,x,y] = responses2(input,kappa);

% Plot responses
figure
plot(input,theta)
hold on
plot(input,x)
hold on
plot(input,y)
ylim([0 1])
title("Input vs Responses for \kappa = " + kappa)
xlabel("Input, 1/\kappa_D")
ylabel("Responses")
legend("\theta_B", "x^*", "y^*")
hold off

% Part c
%must change ranges to get good fit for different kappas
data = linspace(0.01,5,50);     %for 0.1, 5 max and for 10, 15
[theta,~,~] = responses2(data,kappa);
g = [];
fun =  @(z,data) data.^z(1)./(z(2).^z(1)+data.^z(1)); %z(1) = n, z(2) = kappa
var = [1 .1];    %guesses
g(1,:) = lsqcurvefit(fun,var,data,theta);   %theta
hill1 = data.^g(1,1) ./ (g(1,2).^g(1,1)+data.^g(1,1));
boo1 = data;
data = linspace(0.01,1,50);     % 1 and 3
[~,x,~] = responses2(data,kappa);
g(2,:)= lsqcurvefit(fun,var,data,x);    %x
hill2 = data.^g(2,1) ./ (g(2,2).^g(2,1)+data.^g(2,1));
boo2 = data;
data = linspace(0.01,0.3,50);   %0.3 and 1
[~,~,y] = responses2(data,kappa);
g(3,:) = lsqcurvefit(fun,var,data,y);    %y
hill3 = data.^g(3,1) ./ (g(3,2).^g(3,1)+data.^g(3,1));
boo3 = data;

%Check to see if plots are similar to original
figure
hold on
semilogx(boo1,hill1,'-')
semilogx(boo1,theta,'o')
hold off
figure
hold on
semilogx(boo2,hill2,'-')
semilogx(boo2,x,'o')
hold off
figure
hold on
semilogx(boo3,hill3,'-')
semilogx(boo3,y,'o')

% Part d

% Parameters
input = [0.1 0.15];

%Solve x* and y* equations
[ptheta,px,py] = responses2(input,kappa);

pertheta = (ptheta(1,2)-ptheta(1,1))/ptheta(1,1)*100;
perx = (px(1,2)-px(1,1))/px(1,1)*100;
pery = (py(1,2)-py(1,1))/py(1,1)*100;

