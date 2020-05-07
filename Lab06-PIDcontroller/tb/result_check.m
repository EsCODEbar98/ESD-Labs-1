clear
close all
clc
n=1024;

partial =0;
memA_prec = 0;
%READING RANDOM NUMBER FILE
fileID1 = fopen('input.txt','r');
input = strsplit(fileread('input.txt'), { '\r','\n'});
fclose(fileID1);
empties = find(cellfun(@isempty,input));
input(empties) = []  ;
%CONVERSION BINARY TO DOUBLE
for i=1:n
    tmp=typecast(uint8(bin2dec(char(input{i}))),'int8');
    input_dec{i}=double(tmp);
end
%PSEUDOCODE
for i=1:n

    %STATE ADD1
    partial=approx(approx(partial) + approx(input_dec{i}));
    %STATE ADD2
    u_add2=approx(2*partial)+approx(4*input_dec{i});
    %STATE ADD3
    u_add3=u_add2- approx(input_dec{i}/4);
    %STATE ADD4
    u_add4= u_add3+approx(input_dec{i}/2);
    %STATE ADD5
    u_add5=approx(u_add4-approx(memA_prec/2));

%Check Overflow
    if (u_add5 > 127)
        u_add5 =  127;
    elseif (u_add5 < -128)
        u_add5 = -128;
    end
    result(i) = approx(u_add5);
    memA_prec  = input_dec{i};

end


%READING VHDL OUTPUT FILE
fileID2 = fopen('output.txt','r');
VHDL = strsplit(fileread('output.txt'), { '\r','\n'});
fclose(fileID2);

empties = find(cellfun(@isempty,VHDL));
VHDL(empties) = []  ;

for i=1:n
    tmp=str2double(VHDL{i});
    result_vhdl(i)=approx(tmp);
end
%CHECKING FOR RESULT COMPATIBILITY
for i=1:n
    check(i) = isequal(result(i),result_vhdl(i));
end
%FIND ERRORS
error=find(check==0);
error_vhdl=result_vhdl(error);
error_matlab=result(error);



function result=approx(value)

    result=int32(floor(value));

end
