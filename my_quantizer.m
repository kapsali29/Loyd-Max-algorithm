 function [xq,centers] = my_quantizer(x,N,min_value,max_value)
    epipeda=2^N;
    delta=(max_value-min_value)/epipeda;
    anw_akro=[];
    katw_akro=[];
    akro=min_value;

    while akro<max_value
        katw_akro=[katw_akro akro];
        anw_akro=[anw_akro akro+delta];
        akro=akro+delta;
    end
    perioxes=cell(1,length(katw_akro));
    centers=zeros(1,length(katw_akro))
    for i=1:length(katw_akro)
        k=[katw_akro(i) anw_akro(i)];
        perioxes{i}=[k];
        centers(i)=mean(k);
    end
    xq=zeros(1,length(x));
    for i=1:length(perioxes)
        space=perioxes{i};
        for j=1:length(x)
          if (x(j)>=space(length(space)-1))&&(x(j)<space(length(space)))  
            xq(j)=centers(i);
          end
          if x(j)<=min_value
               xq(j)=centers(1);
          end
           if x(j)>=max_value 
             xq(j)=centers(length(centers));  
           end
        end   
    end
    
 end