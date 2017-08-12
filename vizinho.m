function [coordenada,imgout] = vizinho(image,x,y,tipo,logica)

tamanho=size(image);
imgout=image;
coordenada(1,1)=y;
coordenada(2,1)=x;
pos=2;
start=1;

if(image(x,y)==logica)
    if(tipo==4)
        while(start<=length(coordenada(1,:)))
            c=coordenada(1,start);
            lin=coordenada(2,start);
            linha=[lin+1,lin,lin-1,lin];
            coluna=[c,c+1,c,c-1];
            for(i=1:length(linha))
                if((linha(i)>0 && linha(i)<=tamanho(1))&&(coluna(i)>0&&coluna(i)<=tamanho(2)))
                    if(imgout(linha(i),coluna(i))==logica)
                        coordenada(1,pos)=coluna(i);
                        coordenada(2,pos)=linha(i);
                        imgout(linha(i),coluna(i))=not(logica);
                        pos=pos+1;
                    end
                end
            end
            start=start+1;
        end
    end
    if(tipo==0)
        while(start<=length(coordenada(1,:)))
            c=coordenada(1,start);
            lin=coordenada(2,start);
            linha=[lin-1,lin-1,lin+1,lin+1];
            coluna=[c-1,c+1,c-1,c+1];
            for(i=1:length(linha))
                if((linha(i)>0 && linha(i)<=tamanho(1))&&(coluna(i)>0&&coluna(i)<=tamanho(2)))
                    if(imgout(linha(i),coluna(i))==logica)
                        coordenada(1,pos)=coluna(i);
                        coordenada(2,pos)=linha(i);
                        imgout(linha(i),coluna(i))=not(logica);
                        pos=pos+1;
                    end
                end
            end
            start=start+1;
        end
    end
    if(tipo==8)
        while(start<=length(coordenada(1,:)))
            c=coordenada(1,start);
            lin=coordenada(2,start);
            linha=[lin+1,lin+1,lin+1,lin,lin-1,lin-1,lin-1,lin];
            coluna=[c-1,c,c+1,c+1,c+1,c,c-1,c-1];
            for(i=1:length(linha))
                if((linha(i)>0 && linha(i)<=tamanho(1))&&(coluna(i)>0 && coluna(i)<=tamanho(2)))
                    if(imgout(linha(i),coluna(i))==logica)
                        coordenada(1,pos)=coluna(i);
                        coordenada(2,pos)=linha(i);
                        imgout(linha(i),coluna(i))=not(pixellogic);
                        pos=pos+1;
                    end
                end
            end
            start=start+1;
        end
    end
end

end

