function [w1]=w1tentativos(w1_fea,t1_aux,i_r1,D_t,C_t,t,n_t,R,y,Marcha,t_pla,TVr,vt,orden_alea)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% calcula los w1 que hay que evaluar conjuntamente
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1=[];      % retrasos potenciales
%           % tododo los extremos inferiores son candidatos, todos los A >=0
if size(w1_fea,1)==0
    w1_fea=[0 0];
end
if w1_fea(1,1)>0
    w1_fea=[[0 0];w1_fea];
elseif w1_fea(1,1)<0
    w1_fea=[[w1_fea(1,2) w1_fea(1,2)];w1_fea];
end
ind=find(w1_fea(:,1)>=0);
w1=w1_fea(ind,1);

for k=1:size(w1_fea,1)
    B1=w1_fea(k,2);

    t1=orden_alea(t1_aux);
    t2_aux=t1_aux+1;
    tt1_aux=Inf;% tiempo de salida del servicio t1 del area de control
    w1_aux=0;
    %t2max=t1;

    while (t2_aux<=n_t)
        t2=orden_alea(t2_aux);
        %if (t_pla(t2) <=tt1_aux)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%% eleccion de ruta
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if (length(C_t{y(t1),y(t2),t1,t2})>0)
                dim_C=size(C_t{y(t1),y(t2),t1,t2},1);
                C_m=C_t{y(t1),y(t2),t1,t2}+[repmat(t(t1),[dim_C,2]) repmat(t(t2),[dim_C,2])];
                tipoC=Marcha(t1,R{t1}(y(t1)))*Marcha(t2,R{t2}(y(t2)));
                w1_tren=w1tentativo_tren(B1,C_m,tipoC); % para el tren t2
                % depuracion
                %fprintf('t2 = %6.0f  w1 = %6.2f w2 = %6.2f  z  = %6.2f  tipoC= %6.2f \n',t2,w_opt(1),w_opt(2),zz_aux,tipoC);
                w1_tren=EsFactible(w1_tren,w1_fea,k+1); % eliminación w1 no factibles
                w1=[w1; w1_tren]; % demoras potenciales
                w1_aux=max(max(w1_tren),w1_aux);
                tt1_aux= TVr(y(t1))*vt(t1)+t(t1)+w1_aux;
            end
       % end
        %w1

        t2_aux=t2_aux+1;
    end
    %t2max=max(t2max,(t2-1));
end


end