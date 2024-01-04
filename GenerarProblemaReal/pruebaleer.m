%%%%%%%%%%%%%%%%%%%%%%%
%% parametros iniciales
%%%%%%%%%%%%%%%%%%%%%
fileSalida='prueba';
codigo={}
D=[0,1,0.25,2,0.25 ]
vt=30;

codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='    case ''Problem4'' % P R O B L E M   2';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}=' n_t=length(t_pla);  % número de trenes';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
codigo{end+1}='%%    RUTAS: MATRIZ DE CONFLICTOS Y TIEMPOS DE VIAJES';
codigo{end+1}='%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';
n_rutas=8;
Mueve=@(A) [A(:,3) A(:,4) A(:,1) A(:,2)];      

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DAT=importdata('horarios.xlsx')
limpia=@(x) x(find(isnan(x)==0));
CASO1=[1 5 3 7]; % LINEAS C2 Y C7 orden que aparecen los trenes
T=[];
for i=1:length(CASO1)
    aux=limpia(DAT.data(:,CASO1(i)));
    nTren(i)=length(aux);
    T=[T;aux];
end
% trasnformar el tiempo en horas y minutos a una escala continua
T=fix(T)+(T-fix(T))/0.6;
codigo{end+1}=['t_pla=[' sprintf(  '%1.3f ; ', T) '];'];
Ta=T+sum(D)/vt*ones(length(T),1);
codigo{end+1}=['at=[' sprintf(  '%1.3f ; ', Ta) '];'];
aux=vt*ones(length(T),1);
codigo{end+1}=['vt=[' sprintf(  '%0.1f ; ', aux) '];'];



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



