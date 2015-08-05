n=500;
m=n;
close all
Line=zeros(n,m);
b=30;
for x=1:n
    y=-1750+round(10*x)+(-b:b);
    c=y(min(y>0,y<=m)==1);
    Line(x,c)=1;
end

ran=rand(n,m);
Punkte=ran>0.999;
PL=max(Line,Punkte);

imshow(PL)   

%Goal: Find the line 
