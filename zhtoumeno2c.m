[y,fs]=audioread('speech.wav');
N=[2,4,6];
min_value=-1;
max_value=1;
%kanonikopoihsh ths phghs etsi wste na vrisketai sto epitrepto diasthma
%[min_value,max_value]
y=(y-min(y));
f=(min(y)+max(y))/2;
y_c=(y-f)/f;
%eidos_kvantishs=1 gia omoiomorfh kvantish
[ uni_theoritikes_pi8anothtes2,uni_peiramatikes_pi8anothtes2,uni_entropia2,space2] = upologismos_pi8anothtwn( y_c,N(1),min_value,max_value,1);
[ uni_theoritikes_pi8anothtes4,uni_peiramatikes_pi8anothtes4,uni_entropia4,space4] = upologismos_pi8anothtwn( y_c,N(2),min_value,max_value,1);
[ uni_theoritikes_pi8anothtes6,uni_peiramatikes_pi8anothtes6,uni_entropia6,space6] = upologismos_pi8anothtwn( y_c,N(3),min_value,max_value,1);
    
%eidos kvantishs=2 gia mh-omoiomorfh kvantish
[ non_uni_theoritikes_pi8anothtes2,non_uni_peiramatikes_pi8anothtes2,non_uni_entropia2,space2n] = upologismos_pi8anothtwn( y_c,N(1),min_value,max_value,2);
[ non_uni_theoritikes_pi8anothtes4,non_uni_peiramatikes_pi8anothtes4,non_uni_entropia4,space4n] = upologismos_pi8anothtwn( y_c,N(2),min_value,max_value,2);
[ non_uni_theoritikes_pi8anothtes6,non_uni_peiramatikes_pi8anothtes6,non_uni_entropia6,space6n] = upologismos_pi8anothtwn( y_c,N(3),min_value,max_value,2);