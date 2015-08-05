function Out=Output(X,W,n,m,k)
sig=@(x)(1./(1+exp(-x)));
N=size(X,1);
W1=reshape(W(1:(n+1)*k),n+1,k);
W2=reshape(W((n+1)*k+1:end),k+1,m);

X = [X ones(N,1)];    
o1 = [sig(X * W1) ones(N,1)];
Out = sig(o1 * W2);
