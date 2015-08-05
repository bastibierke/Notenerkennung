function v=Mindex(x,m,n,b=false) %x as rwo
if(b)
    v=x(:,1)+(x(:,2)-1)*m;   
else
    v(:,1)=mod(x-1,m)+1;
    v(:,2)=floor((x-1)/m)+1;
end
