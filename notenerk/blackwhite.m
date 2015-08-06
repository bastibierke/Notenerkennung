function M=blackwhite(file,b=.95)


f=imread(file);
if length(size(f))==3
    f=sum(f,3)/(3*257);
end

if sum(sum(f>1.1)>0)
    f=f/257;
end


M=false(size(f));
M(f>b)=true;




    


