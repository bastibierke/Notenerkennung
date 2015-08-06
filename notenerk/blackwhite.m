function M=blackwhite(file,b=.95)


f=imread(file);
if length(size(f))==3
    f=sum(f,3)/(3*255);
end

if sum(sum(f>1.1)>0)
    f=f/255;
end


M=false(size(f));
M(f>b)=true;




    


