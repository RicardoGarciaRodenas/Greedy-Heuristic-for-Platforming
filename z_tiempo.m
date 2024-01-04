function [z2,w2]=z_tiempo(w1,C,D,tipoC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dado  un  valor de w1 fijo calcula el   w2   optimo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% C=[A(1) B(1) A(2) B(2)]
if tipoC==-1
    if (w1+C(1)-C(4))>=0
        w2=0;
    else
        w2=max(w1+C(2)-C(3),0);
    end
elseif tipoC==1
    A=C(3)-C(1)-w1;
    B=C(4)-C(2)-w1;
    if A*B>=0
        w2=0;
    elseif A>0
        w2=-B;
    elseif A<0
        w2=-A;
    end
end
z2=w2+max(D(2)+w2,0);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
