% Generacion de los datos para la estacion de Atocha
% este archivo genera las lineas C2,C7, C4,  C3 y C5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parametros generales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HORARIOS
% https://www.redtransporte.com/madrid/cercanias-renfe/horarios.html
%%%%%%%%%%%%%%%%%
%% inicializacion
%%%%%%%%%%%%%%%%%%
clear,clc,close all
fileSalida='Problema4cS';
codigo={};
vt=40;              % velocidad del tren km/h
lt=0.2;             % longitud del tren en km
bandera_empieza=0;  % variable control escritura formato ]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definicion de distancia de cada tramos
%% Dmas es la distancias hacia la derecha
%% Dmenos es la distancia recorriendo los bloques hacia
%% la izquierda, esto es, 4+3+2+1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=[0,1,0.25,2,0.25 ]; % kilometros asociados a cada bloque
                    % D(1) tunel
                    % D(2) switch 1
                    % D(3) plataforma
                    % D(4) switch 2
Dmas=cumsum(D);
Dmenos=cumsum([0,D(end:-1:2)]);
nBlo=length(D)-1;  % numero de bloques
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% direccion de rutas +1 hacia la derecha -1 hacia izquierda
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dir=[1,1,1,-1,-1,-1,-1,1,1,-1,-1,-1,-1,+1,+1,-1,-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicion de rutas
% Ind{ruta}{seccion}= vias que emple en dicho tramo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ind={};
% C2 y C7
Ind{1}={1, [1,2], 4, 4};
Ind{2}={1, [1,2], 3, [3,4]};
Ind{3}={2, [2,1], 3, 3};
Ind{4}={1, [2,1], 1, 1};
Ind{5}={1, [2,1], 2, [1,2]};
Ind{6}={2, [2,1], 2, 2};
Ind{7}={2, [2,1], 1, [1,2]}; 
% C4 y C3 
Ind{8}={6,     7, 7, 7};
Ind{9}={6, [6,7], 6, [6,7]};
Ind{10}={5,    6, 6, 6};
Ind{11}={5, [5,6],5, [5,6]};
Ind{12}={5, [5,6],5, 5};
Ind{13}={5, [5,6],6, [5,6]};
% C5
Ind{14}={9, [9,10],10, [9,10]};
Ind{15}={9, [9,10], 9,   9};
Ind{16}={8,      8, 8,   8};
Ind{17}={8,  [8,9], 9, [8,9]};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='    case ''Problem4cS'' % P R O B L E M   4';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='%%    RUTAS: MATRIZ DE CONFLICTOS Y TIEMPOS DE VIAJES';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='Mueve=@(A) [A(:,3) A(:,4) A(:,1) A(:,2)];';  
codigo{end+1}=['n_rutas=' sprintf(  '%i ; ', (length(dir)))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Horarios
%% mirar el fichero horarios.xlsx para saber la relación entre
%% columnas y lineas
%
% C2+ -> columna 1
% C2- -> columna 3
% C7+ -> columna 5
% C7- -> columna 7
% C5+ -> columna 9
% C5- -> columna 11
% C4+ -> columna 13
% C4- -> columna 15
% C3+ -> columna 17
% C3- -> columna 19
% CASO1 [1 5 3 7] lineas C2 y C7
tipotren={'C2+','','C2-','','C7+','','C7-','','C5+','','C5-','','C4+','','C4-','','C3+','','C3-'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% horarios
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DAT=importdata('horarios_small.xlsx');% problema pequeño
%DAT=importdata('horarios_depuracion.xlsx'); % horarios depuracion codigo
%DAT=importdata('horarios.xlsx'); % horarios completos
limpia=@(x) x(find(isnan(x)==0));
CASO1=[1 5 13 9 3 7  19 15 11]; % LINEAS C2  C7   C4 y C3 C5
                 % orden que aparecen los trenes. 
                 % OJO los pares están vacios
                 % posición 1 en tipotren C2+
                 % posicion 5 en tipotren C7+,
                 % posicion 13            C4+  
                 % posicion 9 .           C5+
                 % posicion 3 en tipotren C2-
                 % posicion 7 en tipotren C7-
                 % posicion 19 .          C3-
                 % posicion 15 .          C4-
                 % posicion 11            C5-
 % se asume que primero estan todas las lineas direccion +1 y 
 % luegos las lineas direccion -1. Las siguientes variables
 % las cuentan.
 nLineasMas=4;
 nLineasMenos=5;
                 
rutas{1}=[3];    % rutas de C2+ = r3
rutas{2}=[1,2];  % rutas de C7+ = r1 y r2
rutas{3}=[8,9];  %          C4+
rutas{4}=[14,15];% rutas    C5+ 
rutas{5}=[6,7];  %          C2-
rutas{6}=[4,5];  %          C7-
rutas{7}=[10,11];%          C3-
rutas{8}=[12,13];  %        C4-
rutas{9}=[16,17];  %        C5-

% OJO hay que poner el orden de las rutas segun se lee
% el orden de las lineas en el fichero excel y eso lo
% marca la variable CASO1 que se refiere a tipotren

T=[];
Ntipotren=[];
for i=1:length(CASO1)
    aux=limpia(DAT.data(:,CASO1(i)));
    nTren(i)=length(aux);
    T=[T;aux];
    Ntipotren=[Ntipotren, ones(1,nTren(i))*CASO1(i)];
end
% trasnformar el tiempo en horas y minutos a una escala continua
T=fix(T)+(T-fix(T))/0.6;
codigo{end+1}=['t_pla=[' sprintf(  '%1.3f ; ', T) '];'];
Ta=T+sum(D)/vt*ones(length(T),1);
codigo{end+1}=['at=[' sprintf(  '%1.3f ; ', Ta) '];'];
aux=vt*ones(length(T),1);
codigo{end+1}=['vt=[' sprintf(  '%0.1f ; ', aux) '];'];
codigo{end+1}='n_t=length(t_pla);  % número de trenes';
codigo{end+1}=['Ntipotren=[' sprintf(  '%0.1f ; ', Ntipotren) '];'];
codigo{end+1}='tipotren={''C2+'','''',''C2-'','''',''C7+'','''',''C7-'','''',''C5+'','''',''C5-'','''',''C4+'','''',''C4-'','''',''C3+'','''',''C3-''};';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculo de conflictos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for tren1=1:length(Ind)
    for tren2=tren1:length(Ind)
        MC=[]; % matriz de conflictos
        bandera=0;
        for bloque=1:length(Ind{1})
            % tren 1 (realmente es la ruta 1)
            if dir(tren1)==1
                atren1=Dmas(bloque);
                btren1=Dmas(bloque+1);
            else
                b=nBlo+1-bloque;
                atren1=Dmenos(b);
                btren1=Dmenos(b+1);
            end
            % para el tren 2
            if dir(tren2)==1
                atren2=Dmas(bloque);
                btren2=Dmas(bloque+1);
            else
                b=nBlo+1-bloque;
                atren2=Dmenos(b);
                btren2=Dmenos(b+1);
            end
            if length(intersect(Ind{tren1}{bloque},Ind{tren2}{bloque}))>0
                %MC=[MC ;(60/vt)*[atren1,btren1+lt,atren2,btren2+lt]];
                MC=[atren1,btren1+lt,atren2,btren2+lt];
                if bandera==0
                    if bandera_empieza==1
                        codigo{end+1}=['];'];
                        empieza=1;
                    end
                    bandera_empieza=1;
                    codigo{end+1}=['C{', num2str(tren1) ',' num2str(tren2), '}=[', sprintf( '\t %8.3f \t %8.3f \t %8.3f \t %8.3f ', MC) ];
                    bandera=1;
                else
                    codigo{end+1}=[sprintf( '\t\t\t %8.3f \t %8.3f \t %8.3f \t %8.3f ', MC)];
                     end
            end
        end
    end
end

codigo{end+1}='];';
for tren1=1:length(Ind)
    for tren2=tren1:length(Ind)     
        for bloque=1:length(Ind{1})          
            if length(intersect(Ind{tren1}{bloque},Ind{tren2}{bloque}))>0
                codigo{end+1}=['C{', num2str(tren2) ',' num2str(tren1), '}=', 'Mueve(C{', num2str(tren1) ',' num2str(tren2), '});' ];
            break
            end
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generacion sentido de la marcha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
codigo{end+1}='Marcha=zeros(n_t,n_rutas);';  % tipo conflicto:  1= frontal /  2 =alcance
aux=find(dir==+1);


codigo{end+1}=['Marcha(1:', sprintf('%i',(sum(nTren(1:nLineasMas)))) ,sprintf( ',[%i', aux(1)),sprintf( ',%i', aux(2:end)),'])=+1;'];   % tren y ruta (absoluta), hacia la derecha
aux=find(dir==-1);
codigo{end+1}=['Marcha(',sprintf('%i',(1+sum(nTren(1:nLineasMas)))),':', sprintf('%i',(sum(nTren(1:end)))) ,sprintf( ',[%i', aux(1)),sprintf( ',%i', aux(2:end)),'])=-1;'];   % tren y ruta (absoluta), hacia la izquierda
aux=ones(1,length(dir))*Dmas(end);
codigo{end+1}=['TVr=[',sprintf('%1.3f ;',aux(1:end-1)),sprintf('%1.3f ',aux(end)), '];'];
codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];
codigo{end+1}=['%%%  asignacion rutas a trenes'];
codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];   
aux=[];
for i=1:length(nTren)
aux=[aux, i*ones(1,nTren(i))];
end
for i=1:sum(nTren)
    aux2=rutas{aux(i)};
    if length(aux2)>1
    aux1=[sprintf('%i',aux2(1)),sprintf(',%i',aux2(2:end))];
    else
    aux1=sprintf('%i',aux2(1));
    end
    codigo{end+1}=['R{', sprintf('%i',i),'}=[',aux1,'];']; 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% final de fichero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];
codigo{end+1}=['%%%% ordenacion procesamiento de trenes            %%%%%%'];
codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];
codigo{end+1}=['[t_pla,I]=sort(t_pla); % ordenacion de procesamiento de trenes'];
codigo{end+1}=['at=at(I);'];
codigo{end+1}=['vt=vt.^(-1);'];
codigo{end+1}=['vt=vt(I);'];
codigo{end+1}=['Ntipotren=Ntipotren(I);'];
codigo{end+1}=['Raux=R;'];
codigo{end+1}=['Marcha=Marcha(I,:);'];
codigo{end+1}=['for i=1:n_t'];
codigo{end+1}=['   R{i}=Raux{I(i)};'];
codigo{end+1}=['end'];
codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];%%%%%%%%%%
codigo{end+1}=[' %%%                 tiempo de viaje trenes'];
codigo{end+1}=['%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'];
codigo{end+1}=[' for t1=1:n_t'];
codigo{end+1}=['     for i_r=1:length(R{t1})'];
codigo{end+1}=['         D_t(t1,i_r)=TVr(R{t1}(i_r))*vt(t1)-at(t1);'];
codigo{end+1}=['     end'];
codigo{end+1}=[' end'];
codigo{end+1}=[' n_s=0; % numero máximo de conflicto entre un par de trenes'];
codigo{end+1}=['for t1=1:n_t-1'];
codigo{end+1}=['    for t2=t1+1:n_t'];
codigo{end+1}=['        for i_r1=1:length(R{t1})'];
codigo{end+1}=['            r1=R{t1}(i_r1);'];
codigo{end+1}=['            for i_r2=1:length(R{t2})'];
codigo{end+1}=['                r2=R{t2}(i_r2);'];
codigo{end+1}=['                if length(C{r1,r2})>0'];
codigo{end+1}=['                C_t{i_r1,i_r2,t1,t2}=[C{r1,r2}(:,1:2)*vt(t1) C{r1,r2}(:,3:4)*vt(t2)];'];
codigo{end+1}=['                C_t{i_r2,i_r1,t2,t1}=[C{r2,r1}(:,1:2)*vt(t2) C{r2,r1}(:,3:4)*vt(t1)];'];
codigo{end+1}=['                n_s=max(n_s,size(C_t{i_r1,i_r2,t1,t2},1));'];
codigo{end+1}=['                end'];
codigo{end+1}=['            end'];
codigo{end+1}=['        end'];
codigo{end+1}=['    end'];
codigo{end+1}=['end'];

% distancia ruta 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     ESCRITURA DEL FICHERO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fd = fopen(fileSalida,'w');
if fd == -1
    display(sprintf('Cannot create file: %s', file));
else
    fprintf(fd, '%s \n',codigo{:});
    fclose(fd);
end







%union intersect(A,B)