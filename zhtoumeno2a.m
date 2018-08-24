%zhtoumeno 2.a
[y,fs]=audioread('speech.wav');
N=[2,4,6];
min_value=-1;
max_value=1;
%kanonikopoihsh ths phghs etsi wste na vrisketai sto epitrepto diasthma
%[min_value,max_value]
y=(y-min(y));
f=(min(y)+max(y))/2;
y_c=(y-f)/f;
[xq1,centers1,D1]=Lloyd_Max(y_c,N(1),min_value,max_value);
[xq2,centers2,D2]=Lloyd_Max(y_c,N(2),min_value,max_value);
[xq3,centers3,D3]=Lloyd_Max(y_c,N(3),min_value,max_value);

sqnr_2=zeros(length(D1),1);
sqnr_4=zeros(length(D2),1);
sqnr_6=zeros(length(D3),1);

for i=1:length(D1)
    sqnr_2(i)=10*log10(mean(y_c.^2)/D1(i));
end
kmax1=[1:1:length(D1)];
figure(1)
plot(kmax1,sqnr_2,'--');
legend('kmax gia 2 bits ','sqnr ');

for i=1:length(D2)
    sqnr_4(i)=10*log10(mean(y_c.^2)/D2(i));
end
kmax2=[1:1:length(D2)];
figure(2)
plot(kmax2,sqnr_4,'--');
legend('kmax gia 4 bits ','sqnr');

for i=1:length(D3)
    sqnr_6(i)=10*log10(mean(y_c.^2)/D3(i));
end
kmax3=[1:1:length(D3)];
figure(3)
plot(kmax3,sqnr_6,'--');
legend('kmax gia 6 bits','sqnr');
%gia to epomeno erwthma, sqnr epeita apo kmax epanalhpseis
max_timi2=sqnr_2(end);
max_timi4=sqnr_4(end);
max_timi6=sqnr_6(end);