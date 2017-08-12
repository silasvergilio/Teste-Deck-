function[img_out] =  binarize(img_in, threshold)

%%detectando erros
    if(nargin < 2)
        error('numero invalido de argumentos, insira 2 argumentos apenas'); 
    end

    
if(threshold > 255 || threshold < 0)
    error('O valor nao esta dentro do limite');
end

if(ischar(img_in)) 
    img = imread(img_in);
    t = size(img);
    t2 = size(t);
else
     img = img_in;
     t = size(img);
     t2 = size(t);
end


if(t2(2) > 2)
    img_out = rgb2gray(img);
else 
    img_out = img;
end

%%acabou fase de detecção de erros começa função em si

for i = 1:t(1)
    for j = 1:t(2)
        if(img(i,j) > threshold) %verifica o valor do pixel da imagem e compara com o valor limite
            img_out(i,j) = 255;
        else
            img_out(i,j) = 0;
        end
    end
end

    
            
