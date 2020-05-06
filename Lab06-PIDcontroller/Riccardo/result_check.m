clear
close all
clc
n=1024;
%GENERAZIONE CASUALE DI INTERI SU 8 BIT ENTRO IL RANGE INDICATO
Kp=3.75;
Ki=2;
Kd= 0.5;
partial =0;
memA_prec = 0;

fileID1 = fopen('input.txt','r');
input = strsplit(fileread('input.txt'), { '\r','\n'});
fclose(fileID1);
empties = find(cellfun(@isempty,input));
input(empties) = []  ;

for i=1:n
    tmp=typecast(uint8(bin2dec(char(input{i}))),'int8');
    input_dec{i} = cast(tmp,'like',partial);
end
%PSEUDOCODE
for i=1:n
    
    partial =int32(partial+ Ki* input_dec{i});
    
    tmp = int32(Kp * input_dec{i} + partial + Kd * (input_dec{i} - memA_prec ));
    
    if (tmp > 127)
        tmp =  127;
    elseif (tmp < -128)
        tmp = -128;
    end
    result(i) = int32(tmp);
    memA_prec  = input_dec{i};
    
end


%%LETTURA FILE CHE ESCE DAL VHDL E CONFRONTO CON BINARY_OUT

%APERTURA FILE RISULTATI DEL VHDL
fileID2 = fopen('output.txt','r');



VHDL = strsplit(fileread('output.txt'), { '\r','\n'});
fclose(fileID2);
empties = find(cellfun(@isempty,VHDL));
VHDL(empties) = []  ;

for i=1:n
    tmp=str2double(VHDL{i});
    result_vhdl(i)=int32(tmp);
end

for i=1:n
    check(i) = isequal(result(i),result_vhdl(i));
end
error=find(check==0);
error_vhdl=result_vhdl(error);
error_matlab=result(error);


