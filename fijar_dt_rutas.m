function [w_opt,z_opt]=fijar_dt_rutas(t1,w1,D_t,C_t,t,n_t,i_r1,y,R,Marcha)
% optimiza respecto al tren t1, w_opt
%w1
z_opt=Inf;          % coste de la decisión asociada a t1
w_opt=0;            % retraso del tren t1
while length(w1)>0
    z_aux=0;
    for t2=t1+1:n_t
        bandera=1;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% eleccion de ruta
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for j=1:length(R{t2})        
            if length(C_t{i_r1,y(t2),t1,t2})>0
                D=[D_t(t1,i_r1);D_t(t2,y(t2))]+[t(t1);t(t2)];
                dim_C=size(C_t{i_r1,y(t2),t1,t2},1);
                C_m=C_t{i_r1,y(t2),t1,t2}+[repmat(t(t1),[dim_C,2]) repmat(t(t2),[dim_C,2])];
                tipoC=Marcha(t1,R{t1}(i_r1))*Marcha(t2,R{t2}(y(t2)));
                [z,w2]=z_tiempo_multiple(w1(1),C_m,D,tipoC);
                %fprintf('t2 = %6.0f   z  = %6.2f \n',t2,z);
                if bandera==1
                    z_ruta=z;
                    bandera=0;
                end
                z_ruta=min(z_ruta,z);
            end
        end % analisis de rutas
        if bandera==1
            z_ruta=0;
            bandera=0;
        end
        z_aux=z_aux+z_ruta; % coste acumulado por trenes
    end
    z_aux=z_aux+max(D_t(t1,y(t1))+t(t1)+w1(1),0)+w1(1); % función objetivo para dicho w1
    
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