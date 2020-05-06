clear
close all
clc
n=1024;
random_num = int8(randi([-128 127],1,n));
for i=1:n
    %GENERAZIONE DEI NUMERI BINARI SU 8 BIT
    binary_in{i}=dec2bin(typecast(int8(random_num(i)),'uint8'),8);
    
end
fileID1 = fopen('input.txt','w');
for i=1:n
    %SCRITTURA FORMATTATA SU FILE(IL VHDL PRENDE IN IN UN FILE DI TIPO
    %TEXT)
    fprintf(fileID1,'%s\n',binary_in{i})
end
fclose(fileID1);