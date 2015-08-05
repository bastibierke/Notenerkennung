V=@Potential;
close all
s=.5;
a=20;
[S,T]=meshgrid(-a:s:a,-a:s:a);
fun=zeros(size(S));
fun(:)=V([S(:),T(:)]);
colormap(hot())
contourf(S,T,fun);
hold on
colorbar;

% 8 Argumente Pot,x0,iter,dt,z,h,b,u 
p=pfad(V,[0,0],2000,.005,.1,5,1,10);
plot(p(:,1),p(:,2),'LineWidth',3)

%hold on
% normaler Gradientabstieg mit Zufall
%p2=pfad(V,[0,0],200,.02,10,0,1,0);
%plot(p2(:,1),p2(:,2),'g','LineWidth',3)



hold off
