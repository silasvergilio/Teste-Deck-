function [deck_n, naipe] = testa_numeros () %% declaracao da funcao


srcFiles = dir('C:\Users\Silas\Desktop\Projeto Poker\Deck of Cards\*.png'); %seleciona pasta onde as imagens se encontram
b = 0;
deck_n = zeros(1,9);
naipe = zeros(1,4);
erro = 0;
erro2 = 0;

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
    I6 = imcrop(I4,[0 0 90 175]); %corta a imagem para obter apenas 2 objetos: a letra e o naipe
    vetor_conta_n = contaobjetos(I6,4,0);
    vetor_conta_n;
    
    for j = 1 : 8 %laço que percorre as possíveis cartas com numeros do baralho excluindo o 10
        
    if(objetos(2) == 5 + j) %verifica se a carta encontrada é um 2
        deck_n(j) = deck_n(j) + 1;
    
    end
        
    end
    
       if(objetos(2) == 16)
        deck_n(9) = deck_n(9) + 1;
       end
       
       %%inicia identificação dos naipes
       tamanho = length(vetor_conta_n);
       
       
    for i = 1 : tamanho
        
     if( (vetor_conta_n(2,i) >= 2790) && (vetor_conta_n(2,i) <= 2810)) %%ouros
        naipe(1) = naipe(1) + 1;  
     end  
     
     if( (vetor_conta_n(2,i) >= 3610) && (vetor_conta_n(2,i) <= 3630)) %%espadas
        naipe(2) = naipe(2) + 1;  
     end
     
     if(  (vetor_conta_n(2,i) >= 4055) && (vetor_conta_n(2,i) <= 4070)) %%copas
        naipe(3) = naipe(3) + 1;  
     end
     
     if( (vetor_conta_n(2,i) >= 4260) && (vetor_conta_n(2,i) <= 4280)) %%paus
        naipe(4) = naipe(4) + 1;  
     end
     
     
    end
    

    
    
    
    
    
    
end
     
    for i = 1 : length(naipe)
    if(naipe(i) ~= 13)
       erro = 1;
    end
    end
    
    for i = 1 : length(deck_n)
    if(deck_n(i) ~= 4)
      erro2 = 1;
    end
    end

    if(erro ~= 0)
        disp('Erro no Naipe');
    else
        disp('Sem erro no Naipe');
    end
    
    
    if(erro2 ~= 0)
        disp('Erro no Numero');
    else
        disp('Sem erro no Numero');
    end
    
    
    
    
end

