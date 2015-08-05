%Lade das Bild und mach es schwarzweiß (Matrix 0,1)
M=blackwhite('BJ.png');
%finde alle Notenlinien %(Matrix(0,1,...,anz wobei >1 Notenlinien))
[N,anz]=findLines(M);
%finde alle zusammenhängenden Komponenten (1,...,anz,... >anz Komponente)
R=components(N);

imshow(R,colormap(colmap4M(R,anz)))
%imwrite(R,colormap(colmap4M(R,anz)),'BJ_Color.png')



%Test von der Funktion components
%M=[1,0,1,1,1;2,2,2,1,1;0,1,0,1,0;0,0,1,1,0]
%a=components(M)
%subplot(2,1,1)
%imshow(M+1,rainbow(8))
%subplot(2,1,2)
%imshow(a+1,rainbow(8))

