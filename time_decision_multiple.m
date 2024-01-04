function [w_opt,z_opt]=time_decision_multiple(C_m,D,tipoC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% esta función resuelve los conflictos (multiples) entre un par de trenes
% basado en retrasr uno de los dos trenes w_opt=[w_opt(1) w_opt(2)]
% la primera componenete es el retraso del primer tren y la del segundo la
% del segundo.El valor z_opt es el valor de retraso para los dos trenes
% obedeciendo solo a sus conflictos
% C_m lleva en cada fila 1 conflicto y cuatro columnas de la forma [A(1) B(1) A(2) B(2)]
% llegda salida al conflicto para el primer tren y luego para el segundo
% tren
% D es la holgura disponible para llegar a su destino
% tipoC tipo de conflicto = -1 (frontal)  = 1  (alcance)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%
[m,n]=size(C_m); % m numero de conflictos
               % n=4 [A(1) B(1) A(2) B(2)]
z_opt=-inf;
for i=1:m
    aux=C_m(i,:);
    C=[aux(1) aux(2); aux(3) aux(4)];
    if tipoC==-1    % (conflicto frontal)
        [w,z]=opt_conflicto_frontal(C,D);
    elseif tipoC==1   % (conflicto alcance)
        [w,z]=opt_conflicto_alcance(C,D);
        %fprintf('conflicto  =  %6.2f\n',tipoC)
        %fprintf('w1 = %6.0f  w2 = %6.0f   z  = %6.2f \n',w(1),w(2),z);
    end
    if z_opt<=z
        z_opt=z;
        w_opt=w;
    end  
end

end
%%%%%%%%%%%%
%% para un solo conflicto
%%%%%%%%%%%%
function [w,z]=opt_conflicto_frontal(C,D)
A=C(:,1);
B=C(:,2);
% problema primera restriccion disyuntiva
aux1=B(2)-A(1);
if aux1<=0
    w1=[0,0];
    z1=max(D(1),0)+max(D(2),0);
else
    w1=[B(2)-A(1),0];
    z1=max(D(1)+aux1,0)+aux1+max(D(2),0);
end
% problema segunda restriccion disyuntiva
aux2=B(1)-A(2);
if aux2<=0
    w2=[0,0];
    z2=max(D(1),0)+max(D(2),0);
else
    w2=[0,aux2];
    z2=max(D(1),0)+aux2+max(D(2)+aux2,0);
end
if z1<=z2
    w=w1;
    z=z1;
else
    w=w2;
    z=z2;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Resolucion conflictos en el mismo sentido de la marcha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [w,z]=opt_conflicto_alcance(C,D)
A=C(:,1);
B=C(:,2);
% problema primera restriccion disyuntiva
auxA=A(2)-A(1);
auxB=B(2)-B(1);
if (auxA*auxB>=0)
    w=[0,0];
    z=max(D(1),0)+max(D(2),0);
elseif (auxA*auxB<0)
    if auxA>0
        w1=[0,-auxB];
        z1=max(D(1),0)-auxB+max(D(2)-auxB,0);
        w2=[auxA,0];
        z2=max(D(1)+auxA,0)+auxA+max(D(2),0);
    elseif auxA<0
        w1=[auxB,0];
        z1=max(D(1)+auxB,0)+auxB+max(D(2),0);
        w2=[0,-auxA];
        z2=max(D(1),0)-auxA+max(D(2)-auxA,0);
    end
    if z1<=z2
        w=w1;
        z=z1;
    else
        w=w2;
        z=z2;
    end
end
end