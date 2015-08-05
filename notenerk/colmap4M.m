function c=colmap4M(M,anz)
c=[1,1,1];
c(2:anz+1,:)=0;
k=max(max(M));
c(anz+2:k,:)=rand(k-anz-1,3)/(3/2)+1/3;



