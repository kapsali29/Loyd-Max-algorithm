%vasizomaste gia thn apodosh me thn xrhsh tou mean-squared error
%8a eksetasoume thn kwdikopoihsh gia min_value=-1, max_value=1, N=2,4,6
[y,fs]=audioread('speech.wav');
min_value=-1;
max_value=1;
N=[2,4,6];
y=(y-min(y));
f=(min(y)+max(y))/2;
y_c=(y-f)/f;
[xq2d,centers2d] = my_quantizer(y_c,N(1),min_value,max_value);
[xq4d,centers4d] = my_quantizer(y_c,N(2),min_value,max_value);
[xq6d,centers6d] = my_quantizer(y_c,N(3),min_value,max_value);

[xq1l,centers1,D1]=Lloyd_Max(y_c,N(1),min_value,max_value);
[xq2l,centers2,D2]=Lloyd_Max(y_c,N(2),min_value,max_value);
[xq3l,centers3,D3]=Lloyd_Max(y_c,N(3),min_value,max_value);
%dianusma p ferei ta mse gia ka8e N omoiomorfhs kwdikopoihshs
mse1=zeros(length(3),1);
%dianusma p ferei ta mse gia ka8e N mh-omoiomorfhs kwdikopoihshs
mse=zeros(length(3),1);
m1=0;
m2=0;
m3=0;
m4=0;
m5=0;
m6=0;
for i=1:length(y_c)
    m1=m1+(y_c(i)-xq2d(i)).^2;
    m2=m2+(y_c(i)-xq4d(i)).^2;
    m3=m3+(y_c(i)-xq6d(i)).^2;
    m4=m4+(y_c(i)-xq1l(i)).^2;
    m5=m5+(y_c(i)-xq2l(i)).^2;
    m6=m6+(y_c(i)-xq3l(i)).^2;
end
mse(1)=m1/length(y_c);
mse(2)=m2/length(y_c);
mse(3)=m3/length(y_c);

mse1(1)=m4/length(y_c);
mse1(2)=m5/length(y_c);
mse1(3)=m6/length(y_c);
