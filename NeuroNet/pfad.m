function y=pfad(Pot,x,iter=1000,dt=0.1,z=1,h=1,b=1,u=1) 
%8 Argumente Pot,x0,iter,dt,z,h,b,u
% y enthält zeilenweise die Koordinaten entlang des Pfades

n=size(x,2);
%Pot  Potential
%x    startwert
%iter Anzahl an Iterationen
%dt   grad*dt, also fungiert dt als Schrittweite
%z    Zufallseinfluss
%h    höhe
%b    breite
%u    Potentialanhebung gegen unendlich
y=zeros(iter,n);

for i=1:iter
    y(i,:)=x;
    [V,gradV]=Pot(x);
    d=y(1:i,:)-repmat(x,i,1);
    gradV2=gradV+2*h*sum(repmat(exp(-sum(d.^2,2)/(2*b)),1,n).*d,1);  
    if (norm(x)!=0)
        gradV2=gradV2+u*x/sqrt(norm(x)); %nicht ganz wie in den Notizen
    end
    x=x-gradV2*dt+dt*z*(randi(0:1,1,n)*2-1);
end
