function N=components(M)
%components findet alle zusammenhängenden Komponenten

    lzahl=max(max(M));
    zahl=max(lzahl+1,2);
    [m,n]=size(M);
    
    start=find(M==0,1);   
    f=false(m,n);       %häufig genutzt;
    while(length(start)>0)
        
        
        neu=f;
        neu(start)=true;
        neul=f;
        alt=f;
        make=f;      
        while(sum(sum(neu+neul))>0)        
            x=Mindex(find(neu)',m,n);
            y=Mindex(find(neul)',m,n);
            make(find(neu))=true;
            alt(neu)=true;
            alt(neul)=true;
            neu=f;
            neul=f;
            for i=1:size(x,1);
                v=max(x(i,1)-1,1):min(x(i,1)+1,m);
                w=max(x(i,2)-1,1):min(x(i,2)+1,n);
                for l=1:length(v)
                    for k=1:length(w)
                        a=M(v(l),w(k));
                        if(a==1||alt(v(l),w(k)))
                            
                        elseif(a==0)
                            neu(v(l),w(k))=true;
                        else
                            neul(v(l),w(k))=true;
                        end
                    end
                end                                
            end                    
            
            for i=1:size(y,1);
                v=max(y(i,1)-1,1):min(y(i,1)+1,m);
                w=y(i,2);
                for l=1:length(v)
                    for k=1:length(w)
                        a=M(v(l),w(k));
                        if(a==1||alt(v(l),w(k)))
                            break;
                        elseif(a==0)
                            neu(v(l),w(k))=true;
                        else
                            neul(v(l),w(k))=true;
                        end
                    end
                end                                
            end
                                        
        end           
        
         
       M(make)=zahl; 
       start=find(M==0,1);
       zahl+=1;
    end
    N=M;
