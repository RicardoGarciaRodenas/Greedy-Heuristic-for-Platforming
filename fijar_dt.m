function [w_opt,z_opt]=fijar_dt(t1_aux,w1,D_t,C_t,t,n_t,i_r1,y,R,Marcha,orden_alea)
t1=orden_alea(t1_aux);
% optimiza respecto al tren t1, w_opt
%w1
z_opt=Inf;
w_opt=0;
while length(w1)>0
z_aux=0;
for t2_aux=t1_aux+1:n_t
    t2=orden_alea(t2_aux);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% eleccion de ruta
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if length(C_t{i_r1,y(t2),t1,t2})>0
        D=[D_t(t1,i_r1);D_t(t2,y(t2))]+[t(t1);t(t2)];
        dim_C=size(C_t{i_r1,y(t2),t1,t2},1);
        C_m=C_t{i_r1,y(t2),t1,t2}+[repmat(t(t1),[dim_C,2]) repmat(t(t2),[dim_C,2])];        
        tipoC=Marcha(t1,R{t1}(i_r1))*Marcha(t2,R{t2}(y(t2)));
        [z,w2]=z_tiempo_multiple(w1(1),C_m,D,tipoC);
        %fprintf('t2 = %6.0f   z  = %6.2f \n',t2,z);
        z_aux=z_aux+z;    
    end
end
z_aux=z_aux+max(D_t(t1,i_r1)+t(t1)+w1(1),0)+w1(1); % función objetivo para dicho w1

%fprintf('w1 = %6.2f   z_w1  = %6.2f \n',w1(1),z_aux);

%%%%%%%%%%%%%%%%%%
if z_aux<=z_opt
    z_opt=z_aux;
    w_opt=w1(1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% eliminacion de  w1 analizados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1=w1(find(not(w1==w1(1))));
end

%%%%%%%%%%%%%%
if z_opt==Inf
    z_opt=0;
end

end