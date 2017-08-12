function [deck, naipe] = testa_letras () %% declaracao da funcao


srcFiles = dir('C:\Users\Silas\Desktop\Projeto Poker\Deck of Cards\*.png'); %seleciona pasta onde as imagens se encontram
b = 0;
deck = zeros(1,4);
naipe = zeros(1,4);
erro = 0;
for i = 1 : length(srcFiles) %%for que percorre a pasta 
    filename = strcat('C:\Users\Silas\Desktop\Projeto Poker\Deck of Cards\',srcFiles(i).name); %%contatenação entre o endereço da pasta e o nome do arquivo
    I =  imread(filename); %%leitura da imagem 
    I2 = rgb2gray(I); %%passa imagem pra preto e branco
    %figure,imshow(I2);
    I3 = imcrop(I2,[8 10 485 708]); %%corta a imagem original tirando as bordas indesejadas
    %figure,imshow(I3); %imagem cortada e rgb2grayzada
    I4 = binarize(I3,250); %%padroniza nível de preto nas imagens para facilitar as contas 
    %figure,imshow(I4); %imagem binarizada
    vetor_conta = contaobjetos(I4,4,0); %%função que conta número de objetos 
    vetor_conta;
    objetos = size(vetor_conta); %variavel que armazena os valores de tamanho do vetor que conta o numero de objetos
    if(objetos(2) == 5) %verifica se foram achados 5 objetos na figura(representando as cartas A,J,Q,K)
    b = b +1 ; %numero de cartas com figuras -> A,J,Q,K
    I5 = imcrop(I4,[8 10 85 22]); %corta a imagem resultante na horizontal
    I6 = imcrop(I4,[0 0 90 175]); %corta a imagem para obter apenas 2 objetos: a letra e o naipe
    %figure, imshow(I6); %mostra figuras cortas para aparecer letra e naipe
    vetor_conta_n = contaobjetos(I6,4,0); %%função que conta número de objetos
    vetor_conta_n; %%exibe o numero de objetos e quantos pixels cada um deles tem, onde o primeiro objeto é a letra e o segundo o naipe
    vetor_conta2 = contaobjetos(I5,4,0); %%função que conta número de objetos
    objetos2 = size(vetor_conta2);
    if(objetos2(2) == 2) %verifica se com o corte surgiram dois objetos
    pixels(i) = vetor_conta2(2,1) + vetor_conta2(2,2); %soma os pixels dos dois objetos
    else 
    pixels(i) = vetor_conta2(2,1); %armazena o número de pixels do objeto resultante
    end
    
    
    %inicia identificação do naipe da carta atual
    if( (vetor_conta_n(2,2) >= 2790) && (vetor_conta_n(2,2) <= 2810)) %%ouros
        naipe(1) = naipe(1) + 1; 
    end
    
    if( (vetor_conta_n(2,2) >= 3610) && (vetor_conta_n(2,2) <= 3630)) %%espadas
        naipe(2) = naipe(2) + 1;  
    end
    
    if( (vetor_conta_n(2,2) >= 4055) && (vetor_conta_n(2,2) <= 4070)) %%copas
        naipe(3) = naipe(3) + 1; 
    end
    
    if( (vetor_conta_n(2,2) >= 4260) && (vetor_conta_n(2,2) <= 4280)) %%paus
        naipe(4) = naipe(4) + 1; 
    end
       
    end
end

%inicia verificação dos padrões de pixels para identificar cartas A,J,Q,K
%de acordo com a faixa de puxel que se encontram
for i = 1 : length(pixels)
if((pixels(i) >= 420) && (pixels(i) <= 435))
    deck(1) = deck(1) + 1;
    
end
    
if((pixels(i) >= 230) && (pixels(i) <= 235))
    deck(2) = deck(2) + 1;   
end

if((pixels(i) >= 542) && (pixels(i) <= 655))
    deck(3) = deck(3) + 1;
    
end

if((pixels(i) >= 530) && (pixels(i) <= 541))
    deck(4) = deck(4) + 1;
    
end

end

for i = 1 : length(naipe)
    if(naipe(i) ~= 4)
        erro = erro + 1;
    end
end

for i = 1 : length(deck)
    if(deck(i) ~= 4)
        erro = erro +1;       
    end
    
        
end

deck
naipe

if(erro ~= 0)
    error('Baralho Com Defeito ! '); 
        

end




