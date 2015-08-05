%Neronales Netzwerk mit 2 Layern
%Eingabe Trainingsdaten X mit Ausgabe 0, Anzahl Perzeptronen, aktuelle Gewichtsmatrix als Zeile
%Fehler und Gradient bei aktuellen Gewichten
function [E, Egrad] = NN2L (X, Y, k, W)
%W als Zeile
sig=@(x)(1./(1+exp(-x)));
N = size(X,1);
n = size(X,2);
m = size(Y,2);

W1=reshape(W(1:(n+1)*k),n+1,k);
W2=reshape(W((n+1)*k+1:end),k+1,m);

X = [X ones(N,1)];
    
o1 = [sig(X * W1) ones(N,1)];
D1 = o1(:,1:end-1) .* (1-o1(:,1:end-1));
o2 = sig(o1 * W2);
D2 = o2 .* (1-o2);
er  = o2-Y;
E = sum(er(:).^2)/2;
d2 = D2 .* er;
d1 = D1 .* (d2*W2(1:end-1,:)');

DW1 = (d1'*X)';
DW2 = (d2'*o1)';
Egrad=[DW1(:)', DW2(:)'];


% numerisch berechneter Gradient, sofern Fehlerfunktion richtig ist
%ds=.0001;
%for i=1:length(W)
%    Wi=W;
%    Wi(i)=Wi(i)+ds;
%    Wi1=reshape(Wi(1:(n+1)*k),n+1,k);
%    Wi2=reshape(Wi((n+1)*k+1:end),k+1,m);
%    
%    o1 = [sig(X * Wi1) ones(N,1)];
%    D1 = o1(:,1:end-1) .* (1-o1(:,1:end-1));
%    o2 = sig(o1 * Wi2);
%    D2 = o2 .* (1-o2);
%    er  = o2-Y;
%    Ei = sum(er(:).^2)/2;        
%    Egrad(i)=(Ei-E)/ds;
    
%end








