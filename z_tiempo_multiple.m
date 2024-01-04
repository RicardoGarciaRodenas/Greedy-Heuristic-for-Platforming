function [w_opt,z_opt]=time_decision_multiple(w1,C_m,D,tipoC)

[m,n]=size(C_m); % m numero de conflictos
               % n=4 [A(1) B(1) A(2) B(2)]
z_opt=-inf;
for i=1:m
    [z2,w]=z_tiempo(w1,C_m(i,:),D,tipoC);
    if z_opt<=z2
        z_opt=z2;
        w_opt=w;
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
