clear all
close all
train = load("pendigits-training.txt");
test = load("pendigits-testing.txt");

Xtrain = train(:, 1:end-1);
Ytrain = train(:,end);
Xtest = test(:, 1:end-1);
Ytest = test(:,end);

% auf 1 normieren

r=2; %Repräsentation der Ziffer gemäß Methode r
Ytr=Repres(Ytrain,r);


k=10;
n = size(Xtrain,2);
m = size(Ytr,2);
E=@(W)(NN2L(Xtrain,Ytr,k,W));
Error=@(p)(arrayfun(@(i)(E(p(i,:))),1:size(p,1)));

%8 Argumente Pot,x0,iter,dt,z,h,b,u;
%iter=2000;dt=10.^[-5];z=[1];h=[1 5 10];b=[2];u=[20 80];
%5 min .91 Güte
iter=4000;dt=1e-4;z=0.000000001;h=10;b=2;u=30;
%iter=4000;dt=1e-4;z=.01;h=10;b=2;u=30;



for i=1:length(dt)
    Fehler=zeros(iter,0);
    count=1;
    figure(i)
    for j=1:length(h)        
        for l=1:length(z)                
            for s=1:length(b)
                for t=1:length(u)
                    W=zeros(1,(n+1)*k+(k+1)*m);
                    p=pfad(E,W,iter,dt(i),z(l),h(j),b(s),u(t));
                    Fehler(:,count)=Error(p)';
                    Werte(count,:)=[count,z(l),h(j),b(s),u(t)];
                    count=count+1;
                end
            end
        end
    end    
    plot(Fehler)
    legend
    title(dt(i))
end
%'data z h b u'
%Werte

if(true)    
    [mini, amini]=min(Fehler(:,end));    
    Out=Repres(Output(Xtrain,p(amini,:),n,m,k),r,true);
    Guete_train=sum(Out==Ytrain)/size(Ytrain,1)
        
    Out2=Repres(Output(Xtest,p(amini,:),n,m,k),r,true);
    Guete_test=sum(Out2==Ytest)/size(Ytest,1)       
end














