function[n]=num_figuras(imagem)
%função para contar o núm de figuras pretas de uma imagem e
%a quant de pixels de cada figura; retorna a imagem sem as figuras encontradas.

s1=size(imagem);

n=0;

for lin=1:s1(1) %"varre" uma linha por vez.
    for col=1:s1(2)
        if(imagem(lin,col)==1)
            %chama a função "pixels_conectados3":
            [pixels_conectados,imagem_out]=pixels_conectados3(imagem,lin,col,0);
            imagem=imagem_out;
            s2=size(pixels_conectados);
            if(s2(2)>5)
                n=n+1;
            end
        end
    end
end
end


            