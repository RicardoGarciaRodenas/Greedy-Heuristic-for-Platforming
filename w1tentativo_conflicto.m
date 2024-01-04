function w1_opt=w1tentativo_conflicto(B1,C,tipoC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dado  una cota para  w1>=B1  calcular tenteativos w1 optimo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% C=[A(1) B(1) A(2) B(2)]
if tipoC==-1
    A=C(3)-C(2)-B1;
    B=C(4)-C(1)-B1;
    if A>=0 | B<=0
        w1_opt=B1;
    else
        w1_opt=[C(4)-C(1); B1];
    end
    
elseif tipoC==1
    
    A=C(3)-C(1)-B1;
    B=C(4)-C(2)-B1;
    if A*B>=0
        w1_opt=B1;
    elseif A>0
        w1_opt=[B1;C(3)-C(1)];
    elseif A<0
        w1_opt=[B1;C(4)-C(2)];
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
