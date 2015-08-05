%hier sind 3 Möglichenkeiten, die Zahlen 0 bis 9 zu kodieren
function O =Repres(y,R,reverse=false)
if reverse
   switch(R)
        case 1
            O=floor(y*9);    
        case 2
            [m,O]=max(y');
            O=O'-1; 
        case 3
            O=sum(repmat(2.^[3:-1:0],size(y,1),1).*round(y),2);
   endswitch
else    
    
   
switch(R)
    case 1
        O=y/(9);
    case 2
        O=repmat(0:9, size(y,1), 1) == repmat(y,1,10);
    case 3
        O=zeros(length(y),4);
        for i=1:4
            a=(y>=2^(4-i));
            O(a,i)=1;
            y(a)=y(a)-2^(4-i);        
        end
endswitch
end

