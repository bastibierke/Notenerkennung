function [N, anz]=findLines(M)
%Finde waagerechte Linien, indem mindestens p der Pixel in der Zeile schwarz sind.
[m,n]=size(M);
p=0.5;

l=(sum(M,2)<(1-p)*n);
l2=(1:m)(l);
l3=zeros(0,2);

anz=0;
if(length(l2)>0)
    l3(1,:)=[l2(1),l2(1)];
    anz=1;
    i=2;
    while (i<=length(l2))
       if l2(i)-1==l3(anz,2)
             l3(anz,2)=l2(i);
       else
            anz+=1;
            l3(anz,:)=[l2(i),l2(i)];
       end  
       i=i+1;
     end
end

%keine Lücken von größer als 1 Pixel, Ende müssen wenigstens 3 Pixel sein

L=zeros(anz,4);
L(:,1:2)=l3;


a1=3;
a2=2;


for i=1:anz
    A=0;
    B=0;
    for a=1:n
        for b=n:-1:a+max([B-A,a1,a2*2,])
            c=sum(M(l3(i,1):l3(i,2),a:b)==0,1)>0;
                        
           % k=length(c);      
           % H=abs(repmat((1:k-2*a2)',1,k)-repmat((1:k)-a2,k-2*a2,1))<=a2;                
            %if(sum(H*c'<=2*a2)==0)
             %   A=a;
              %  B=b;
            %end            
            

            
            isline=(sum([c(1:3),c(end-2:end)])==6);
            if(isline)
                for j=3:b-a-1
                   if( sum(c(j-2:j+2))<4)
                        isline=false;
                        break; 
                   end
                end
            end
            
            if(isline)
               if B-A<b-a
                    A=a;
                   B=b;                   
                end                                
            end
                
        end
    end
    L(i,3)=A;
    L(i,4)=B;
end

L;
N=zeros(size(M));
for i=1:anz
    N(L(i,1):L(i,2),L(i,3):L(i,4))=i+1;
end
N(M==1)=1;



