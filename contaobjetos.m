function [vetorsaida] = contaobjetos(image,tipo,logica)

tamanho=size(image);
imgout=image;
conta=0;

for(v=1:tamanho(1))
    for(b=1:tamanho(2))
        if(imgout(v,b)==logica)
            [pos,imgout]=vizinho(imgout,v,b,tipo,logica);
            conta=conta+1;
            contavec(conta)=conta;
            qtdpixel(conta)=length(pos(1,:));
            vetorsaida=[contavec;qtdpixel];
        end
    end
end

