% Program to study load forecasting using extrapolation / time series method.

clc; clear;

% inputs
year=[1990 1995 2000 2005 2010];
%load=[300 350 410 490 600];
load = [300 310 450 520 750];

year2=[2010 2015 2020 2025]

%coefficients of polynomial
p1=polyfit(year,load,1);
p2=polyfit(year,load,2);
p3=polyfit(year,load,3);
 
%polyval is to find the value of the polynomial
figure(1)
set(gcf,'Name','original & 1st order','Color','w')
plot(year,load,'ro','LineWidth',2)
hold on;
plot(year,polyval(p1,year),'-b','LineWidth',2)
hold on;
plot(2025,polyval(p1,2025),'r*','LineWidth',6)
axis([1990 2050 300 2030])
xlabel('YEAR')
ylabel('PEAK LOAD IN MW')
txt = sprintf('Best fit line y=%.2fx + %.2f',p1(1),p1(2));
legend('Scatter diagram',txt,'Forecasted load');
 
figure(2)
set(gcf,'Name','original & 2nd order','Color','w')
title('LOAD FORECASTING USING EXTRAPOLATION METHOD')
plot(year,load,'rS','LineWidth',2)
hold on;
plot(year,polyval(p2,year),'-k','LineWidth',2)
hold on;
plot(year2,polyval(p2,year2),'r:')
hold on;
plot(2025,polyval(p2,2025),'ks','LineWidth',5)
axis([1990 2050 300 1500])
xlabel('YEAR')
ylabel('LOAD')
txt = sprintf('Best fit line y=%.2fx^2 + %.2fx + %.2f',p2(1),p2(2),p2(3));
legend('Scatter diagram',txt,'Extended tend curve','Forecasted load');
 
figure(3)
set(gcf,'Name','Extrapolation:1st and 2nd trend curves','Color','w')
plot(year,load,'rs','LineWidth',2)
hold on;
plot(year,polyval(p1,year),'-b','LineWidth',2)
hold on;
plot(2025,polyval(p1,2025),'b*','LineWidth',6)
hold on;
%plot(year,load,'rS','LineWidth',2)
%hold on;
plot(year,polyval(p2,year),'-k','LineWidth',2)
hold on;
plot(year2,polyval(p2,year2),'r:')
hold on;
plot(2025,polyval(p2,2025),'ks','LineWidth',5)
axis([1990 2026 300 1800])
xlabel('YEAR')
ylabel('PEAK LOAD IN MW')
txt1 = sprintf('Best fit line y=%.2fx + %.2f',p1(1),p1(2));
txt2 = sprintf('Best fit line y=%.2fx^2+%.2fx+%.2f',p2(1),p2(2),p2(3));
legend('Scatter diagram',txt1,'Forecasted load-1st order trend curve', txt2,'Forecasted load-2nd order trend curve');

