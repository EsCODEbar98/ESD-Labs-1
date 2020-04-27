// pseudo-code stuff c++ syntax-like
#define PAR 1024
#define Kp  3.75
#define Ki  2
#define Kd  0.5

int data_in [PAR], memA[PAR], memB [PAR];
int partial = 0;

// getting data
for (int i = 0; i < PAR ; ++i)
   memA[i] = data_in [i];



// processing data
int tmp; // sul parallelismo MASSIMO
int memA_prec = 0;
for (int i = 0; i< PAR; ++i){
    partial += Ki* memA[i];		    
    
    tmp = Kp * memA[i] + partial + Kd * (memA[i] - memA_prec );

    if (tmp > 127) 
       tmp =  127;
    else if (tmp < -128)
       tmp = -128;

    memB[i] = tmp;
    memA_prec  = memA[i];
}
 
