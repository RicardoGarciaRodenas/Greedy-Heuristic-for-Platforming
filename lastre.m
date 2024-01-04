function [w_lastre,z_lastre]=lastre(t1,i_r1,D_t,C_t,t,n_t,R,y,Marcha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcula la demora en el sercicio actual t1 debido a los servicios 
% previamente prefijados y para la eleccion de la ruta r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z_lastre=0;
z=0;
w2=0;
w_lastre=0;
for t2=1:t1-1
if length(C_t{y(t2),i_r1,t2,t1})>0
    D=[D_t(t2,y(t2));D_t(t1,i_r1)]+[t(t2);t(t1)];
    dim_C=size(C_t{y(t2),i_r1,t2,t1},1);
    C_m=C_t{y(t2),i_r1,t2,t1}+[repmat(t(t2),[dim_C,2]) repmat(t(t1),[dim_C,2])];
    % al cambiarle el orden [t2 t1] le pongo w=0 la primero (t2) y calculo
    % el retraso en t1
    tipoC=Marcha(t1,R{t1}(y(t1)))*Marcha(t2,R{t2}(y(t2)));
    [z,w2]=z_tiempo_multiple(0,C_m,D,tipoC); 
end
if z_lastre<z
    w_lastre=w2;
    z_lastre=z;
end
end
end