function N=trim(M,l,r,u,d)
m=size(M,1);
n=size(M,2);
N=M(round(1+u*m):round((1-d)*m),round(1+l*n):round((1-r)*n));

