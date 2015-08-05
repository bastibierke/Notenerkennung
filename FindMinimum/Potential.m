function [V,gradV]=Potential(x)  %x als Zeile
V=100*cos(x(:,1)).*sin(x(:,2));
gradV=100*[-sin(x(:,1)).*sin(x(:,2)), cos(x(:,1)).*cos(x(:,2))];

