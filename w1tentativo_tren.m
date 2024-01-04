function w1=w1tentativo_tren(B1,C_m,tipoC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calcula todos los valores tentativos para w1 pensando
%% en un tren determinado, reflejado por C_m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(C_m); % m numero de conflictos
               % n=4 [A(1) B(1) A(2) B(2)]
w1=[];
for i=1:m
    w=w1tentativo_conflicto(B1,C_m(i,:),tipoC);
    w1=[w1; w];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
