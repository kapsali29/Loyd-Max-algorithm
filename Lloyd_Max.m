function [xq, centers, D,spaces] = Lloyd_Max(x, N, min_value, max_value)
    %spaces:ta akra twn perioxwn kvantishs
    epipeda=2^N;
    delta=(max_value-min_value)/epipeda;
    anw_akro=[];
    katw_akro=[];
    akro=min_value;
    %to arxiko sunolo perioxwn 8a einai omoiomorfes perioxes(isapexontes)
     while akro<max_value
            katw_akro=[katw_akro akro];
            anw_akro=[anw_akro akro+delta];
            akro=akro+delta;
     end
     D=[0];
     xq=zeros(1,length(x));
     perioxes=cell(1,length(katw_akro));
     centers=zeros(1,length(katw_akro));
     for i=1:length(katw_akro)
            perioxes{i}=[katw_akro(i) anw_akro(i)];
            centers(i)=mean(perioxes{i});
     end
     xq=zeros(1,length(x));
        for k=1:length(perioxes)
            s=perioxes{k};
            for j=1:length(x)
              if (x(j)>=s(length(s)-1))&&(x(j)<s(length(s)))  
                xq(j)=centers(k);
              end
              if x(j)<=min_value
                   xq(j)=centers(1);
              end
               if x(j)>=max_value 
                 xq(j)=centers(length(centers));  
               end
            end   
        end
     D=[D mean((x'-xq).^2)];
     i=2;
     while abs(D(i)-D(i-1))>=eps
         temp=[];
         for j=1:length(centers)-1
             temp=[temp (centers(j)+centers(j+1))/2];
         end
         spaces=[min_value,[temp],max_value]
         for p=1:length(spaces)-1
             perioxes{p}=[spaces(p) spaces(p+1)];
         end
         for j=1:length(spaces)-1
             centers(j)=mean(x(x>=spaces(j) & x<=spaces(j+1)));
         end
         xq=zeros(1,length(x));
        for k=1:length(perioxes)
            s=perioxes{k};
            for j=1:length(x)
              if (x(j)>=s(length(s)-1))&&(x(j)<s(length(s)))  
                xq(j)=centers(k);
              end
              if x(j)<=min_value
                   xq(j)=centers(1);
              end
               if x(j)>=max_value 
                 xq(j)=centers(length(centers));  
               end
            end   
        end
        D=[D mean((x'-xq).^2)];
        i=i+1;
     end
end