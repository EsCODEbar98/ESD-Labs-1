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
    input_dec{i}=approx(tmp);
end
%PSEUDOCODE
for i=1:n

    partial=approx(approx(partial) + approx(input_dec{i}));
    tmp1=approx(Ki*partial)+approx(4*input_dec{i});
    tmp2=approx(tmp1- approx(input_dec{i}/4));
    tmp3= tmp2+approx(input_dec{i}/2);
    tmp4=approx(tmp3-approx(memA_prec/2));
   

    if (tmp4 > 127)
        tmp4 =  127;
    elseif (tmp4 < -128)
        tmp4 = -128;
    end
    result(i) = approx(tmp4);
    memA_prec  = approx(input_dec{i});

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
    result_vhdl(i)=approx(tmp);
end

for i=1:n
    check(i) = isequal(result(i),result_vhdl(i));
end
error=find(check==0);
error_vhdl=result_vhdl(error);
error_matlab=result(error);


function result=approx(value)
result=int32(round(value));
end
