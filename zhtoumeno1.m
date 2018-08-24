%dhmiourgia phghs A
M=10000;
t = (randn(M,1)+j*randn(M,1))/sqrt(2);
x= abs(t).^2;
min_value=0;
max_value=4;
N1=4;
N2=6;
[xq1,centers1] =  my_quantizer(x,N1,min_value,max_value);
[xq2,centers2] =  my_quantizer(x,N2,min_value,max_value);

%zhtoumeno 1.a
xq1=transpose(xq1);
xq2=transpose(xq2);
D1=mean((x - xq1).^2);
D2=mean((x - xq2).^2);
SQNR1=10*log10(mean(xq1.^2)/D1);
SQNR2=10*log10(mean(xq2.^2)/D2);
%arxika dhmiourgoume mia nea metavlhth, thn metavlhth z
syms z
%h phgh A akolou8ei thn ek8etikh katanomh h opoia apo to z(-oo ,0] einai
%mhden kai apo to [0,+oo) einai exp(-z)
%h 8ewrhtikh paramorfwsh upologizetai apo ta oloklhrwmata stis omoiomorfe 
%perioxes twn x-xq
y=(z -centers1).^2;
theoritiko_D= zeros(length(y)+2, 1);
%epeidh h pdf einai mhden sto (-oo,0] tote kai h diamorfwsh einai mhden sto
%mhden
delta1=(max_value-min_value)/2^N1;
diasthmata=[min_value:delta1:max_value];
theoritiko_D(1)=0;
theoritiko_D(end)=int(y(end)*exp(-z), diasthmata(end), Inf);
for k = 1:length(y)
	theoritiko_D(k+1) = int(y(k)*exp(-z),diasthmata(k), diasthmata(k+1));
end
theoritiki_D=sum(theoritiko_D);
%gia ton deutero kvantisth exoume ws ekshs
y2=(z -centers2).^2;
theoritiko_D2= zeros(length(y2)+2, 1);
delta2=(max_value-min_value)/2^N2;
diasthmata2=[min_value:delta2:max_value];
theoritiko_D2(1)=0;
theoritiko_D2(end)=int(y2(end)*exp(-z), diasthmata2(end), Inf);
for j = 1:length(y2)
	theoritiko_D2(j+1) = int(y2(j)*exp(-z),diasthmata2(j), diasthmata2(j+1));
end
theoritiki_D2=sum(theoritiko_D2);
%zhtoumeno 1.b
sum=0;
for i=1:length(x)
    if x(i)<min_value || x(i)>max_value
        sum=sum+1;
    end
end

distortion_overload=sum/length(x);