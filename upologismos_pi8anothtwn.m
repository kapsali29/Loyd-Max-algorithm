function [ theoritikes_pi8anothtes,peiramatikes_pi8anothtes,entropia,space] = upologismos_pi8anothtwn( x,N,min_value,max_value,eidos_kvantisth)
    
    if eidos_kvantisth==1
        [xq,centers] = my_quantizer(x,N,min_value,max_value);
        sum=zeros(length(centers),1);
        for i=1:length(xq)
            for z=1:length(centers)
                if(xq(i)==centers(z))
                    sum(z)=sum(z)+1;
                end
            end
        end
        peiramatikes_pi8anothtes=sum/length(xq);
        entropia=0;
        for j=1:length(peiramatikes_pi8anothtes)
            entropia=entropia+peiramatikes_pi8anothtes(j)*log2(1/peiramatikes_pi8anothtes(j));
        end
        delta=(max_value-min_value)/2^N;
        space=[min_value:delta:max_value];
        h=histogram(x,space);
        theoritikes_pi8anothtes=h.Values./(length(x));
    end
    if eidos_kvantisth==2
        [xq, centers,~, spaces]=Lloyd_Max(x, N, min_value, max_value);
        sum=zeros(length(centers),1);
        for i=1:length(xq)
            for z=1:length(centers)
                if(xq(i)==centers(z))
                    sum(z)=sum(z)+1;
                end
            end
        end
        peiramatikes_pi8anothtes=sum./length(xq);
        entropia=0;
        for j=1:length(peiramatikes_pi8anothtes)
            entropia=entropia+peiramatikes_pi8anothtes(j)*log2(1/peiramatikes_pi8anothtes(j));
        end
        space=spaces;
        h=histogram(x,space);
        theoritikes_pi8anothtes=h.Values./(length(x));
    end
end

