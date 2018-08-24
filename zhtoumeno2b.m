[y,fs]=audioread('speech.wav');
N=[2,4,6];
min_value=-1;
max_value=1;
%kanonikopoihsh ths phghs etsi wste na vrisketai sto epitrepto diasthma
%[min_value,max_value]
y=(y-min(y));
f=(min(y)+max(y))/2;
y_c=(y-f)/f;

[xq2b,centers2b] = my_quantizer(y_c,N(1),min_value,max_value);
[xq4b,centers4b] = my_quantizer(y_c,N(2),min_value,max_value);
[xq6b,centers6b] = my_quantizer(y_c,N(3),min_value,max_value);

xq2b=transpose(xq2b);
D2b=mean((y_c - xq2b).^2);
SQNR2b=10*log10(mean(xq2b.^2)/D2b);

xq4b=transpose(xq4b);
D4b=mean((y_c - xq4b).^2);
SQNR4b=10*log10(mean(xq4b.^2)/D4b);

xq6b=transpose(xq6b);
D6b=mean((y_c - xq6b).^2);
SQNR6b=10*log10(mean(xq6b.^2)/D6b);

