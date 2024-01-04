function [w1_lastre]=w1factibles(t1_aux,i_r1,D_t,C_t,t,n_t,R,y,Marcha,orden_alea)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calcula la region factible para el tren t1 dado que se han fijado
%% los trenes 1...t1-1
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
region={};
t1=orden_alea(t1_aux);
for t2_aux=1:t1_aux-1
t2=orden_alea(t2_aux);
if length(C_t{i_r1,y(t2),t1,t2})>0
    D=[D_t(t1,i_r1);D_t(t2,y(t2))]+[t(t1);t(t2)];
    dim_C=size(C_t{i_r1,y(t2),t1,t2},1);
%     C_t{i_r1,y(t2),t1,t2}
%     t1,t(t1)
%     t2,t(t2)
    C_m=C_t{i_r1,y(t2),t1,t2}+[repmat(t(t1),[dim_C,2]) repmat(t(t2),[dim_C,2])];
    
    
    % al cambiarle el orden [t2 t1] le pongo w=0 la primero (t2) y calculo
    % el retraso en t1
    %C_m=[A(2) B(2) A(1) B(1)]
    
    tipoC=Marcha(t1,R{t1}(y(t1)))*Marcha(t2,R{t2}(y(t2)));
    if tipoC==-1
        region{end+1}=[C_m(:,3)-C_m(:,2), C_m(:,4)-C_m(:,1)];
        % quitamos intervalos que el extremo inferior es mayor que el
        % superior
        %ind=find((region{end}(:,2)-region{end}(:,1))>0);
        %region{end}=region{end}(ind,:);
    elseif tipoC==1
        region{end+1}=[C_m(:,3)-C_m(:,1),C_m(:,4)-C_m(:,2)];
    end
    % quitamos intervalos que el extremo inferior es mayor que el
        % superior
        ind=find((region{end}(:,2)-region{end}(:,1))>0);
        region{end}=region{end}(ind,:);
end
end
% fusiona los conflictos de todos los trenes en una secuencia 
% de intervalos prohibidos

if length(region)>0
%     C_m
% region
% for s=1:length(region)
% region{s}
% end
w1_lastre=Rfactible(region);
else
    w1_lastre=[];
end
    
end