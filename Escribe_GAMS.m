function Escribe_GAMS(fileSalida,t_pla,n_rutas,n_s,n_t,R,C_t,Marcha,D_t,at,id,file_name,file_directory)
gams={};
%gams{end+1}=['file resultados  /C:\Users\MAT\Desktop\m-microHeuristico\codigo\problemas\resultados\' file_name str2num(id) '.txt/'];
gams{end+1}=['file resultados  /.\resultados\' file_name str2num(id) '.txt/'];
gams{end+1}='put resultados';
gams{end+1}='options OPTCR=0.0001;';
gams{end+1}='options Reslim=3600;';
gams{end+1}='options MIP=CPLEX;'; 
gams{end+1}='options Savepoint=1;';
gams{end+1}='SETS';
gams{end+1}=['t trains  /t1*' 't' num2str(length(t_pla)) '/'];
gams{end+1}=['r routes /r1*r' num2str(n_rutas) '/'];
gams{end+1}=['s track segments/s1*s' num2str(n_s) '/'];
gams{end+1}='Rt(t,r) subset of routes used by trains /';
for t1=1:n_t
for i_r1=1:length(R{t1})
r1=R{t1}(i_r1);
gams{end+1}=['t' num2str(t1) '.r' num2str(r1) ];
end
end
gams{end+1}='/';
gams{end+1}='c(t,t,r,r,s) conflicts /';
for t1=1:n_t-1
    for t2=t1+1:n_t
        for i_r1=1:length(R{t1})
            r1=R{t1}(i_r1);
            for i_r2=1:length(R{t2})
                r2=R{t2}(i_r2);
                if length(C_t{i_r1,i_r2,t1,t2})>0
                    for s=1:size(C_t{i_r1,i_r2,t1,t2},1)
                        gams{end+1}=['t' num2str(t1) '.t' num2str(t2) '.r' num2str(r1) '.r' num2str(r2) '.s' num2str(s) ];
                    end
                end
            end
        end
    end
end

gams{end+1}='/';
gams{end+1}='ca(t,t,r,r,s) conflicts type a /';
for t1=1:n_t-1
    for t2=t1+1:n_t
        for i_r1=1:length(R{t1})
            r1=R{t1}(i_r1);
            for i_r2=1:length(R{t2})
                r2=R{t2}(i_r2);
                if length(C_t{i_r1,i_r2,t1,t2})>0
                    for s=1:size(C_t{i_r1,i_r2,t1,t2},1)
                        if Marcha(t1,R{t1}(i_r1))*Marcha(t2,R{t2}(i_r2))==-1
                        gams{end+1}=['t' num2str(t1) '.t' num2str(t2) '.r' num2str(r1) '.r' num2str(r2) '.s' num2str(s) ];
                        end
                    end
                end
            end
        end
    end
end
gams{end+1}='/';
gams{end+1}='cb(t,t,r,r,s) conflicts type b /';
for t1=1:n_t-1
    for t2=t1+1:n_t
        for i_r1=1:length(R{t1})
            r1=R{t1}(i_r1);
            for i_r2=1:length(R{t2})
                r2=R{t2}(i_r2);
                if length(C_t{i_r1,i_r2,t1,t2})>0
                    for s=1:size(C_t{i_r1,i_r2,t1,t2},1)
                        if Marcha(t1,R{t1}(i_r1))*Marcha(t2,R{t2}(i_r2))==1
                        gams{end+1}=['t' num2str(t1) '.t' num2str(t2) '.r' num2str(r1) '.r' num2str(r2) '.s' num2str(s) ];
                        end
                    end
                end
            end
        end
    end
end
gams{end+1}='/';
gams{end+1}='alias(t,t1);';
gams{end+1}='alias(t,t2);';
gams{end+1}='alias(r,r1);';
gams{end+1}='alias(r,r2);';
gams{end+1}='******************************************************************************';
gams{end+1}='****      P A R A M E T E R S   O F  T H E   M O D E L';
gams{end+1}='*****************************************************************************';
gams{end+1}='TABLE L(t,t,r,r,s,*) CONFLICT KILOMETERS';
gams{end+1}='                                      a1             b1               a2             b2   ';
gams{end+1}='*                    begin1      end1       begin2      end2 ';

for t1=1:n_t-1
    for t2=t1+1:n_t
        for i_r1=1:length(R{t1})
            r1=R{t1}(i_r1);
            for i_r2=1:length(R{t2})
                r2=R{t2}(i_r2);
                if length(C_t{i_r1,i_r2,t1,t2})>0
                    for s=1:size(C_t{i_r1,i_r2,t1,t2},1)
                        aux1=['t' num2str(t1) '.t' num2str(t2) '.r' num2str(r1) '.r' num2str(r2) '.s' num2str(s) ];
                        for i=length(aux1):25
                            aux1=[aux1 ' '];
                        end
                        aux2=C_t{i_r1,i_r2,t1,t2}(s,:);
                        aux2=aux2+[t_pla(t1) t_pla(t1) t_pla(t2) t_pla(t2)];
                        aux3=sprintf( '\t %8.3f \t %8.3f \t %8.3f \t %8.3f ', aux2(1),aux2(2),aux2(3),aux2(4));
                        gams{end+1}=[aux1 aux3];
                    end
                end
            end
        end
    end
end
gams{end+1}=';';
gams{end+1}='***************************************';
gams{end+1}='****      PARAMETERS OF THE MODEL';
gams{end+1}='***************************************';
gams{end+1}='PARAMETER';
gams{end+1}='M        big number                                      /100/';
gams{end+1}='varepsilon tiempo en desocupacion de track segment       /0.00/';
gams{end+1}='Ctr(t,r) tiempo total de  viajar toda la ruta por el tren t  /';

for t1=1:n_t
     for i_r=1:length(R{t1})
         aux2=D_t(t1,i_r)+at(t1);
         aux1=['t' num2str(t1) '.r' num2str(R{t1}(i_r)) ];
         gams{end+1}= [aux1 '   '  num2str(aux2)];
     end
end
gams{end+1}='/';
gams{end+1}='dt(t)   tiempo planificado de salida /';
for t1=1:n_t
    aux=['t' num2str(t1) ];
    gams{end+1}= [aux '   '  num2str(t_pla(t1))];
end
gams{end+1}='/';
gams{end+1}='pt(t)   tiempo planificado de llegada /';
for t1=1:n_t
    aux=['t' num2str(t1) ];
    gams{end+1}= [aux '   '  num2str(at(t1))];
end
gams{end+1}='/';
gams{end+1}='u(t)    pesos en salidas de los trenes';
gams{end+1}='v(t)    peso en llegadas de los trenes';
gams{end+1}=';';
gams{end+1}='u(t)=1;';
gams{end+1}='v(t)=1;';
gams{end+1}='VARIABLES';
gams{end+1}='D(t)     delayed time at destination sin tener en cuenta el retraso en la salida';
gams{end+1}='OBJ      objective function;';
gams{end+1}='POSITIVE VARIABLE';
gams{end+1}='w(t)      delayed time for train t';
gams{end+1}='h(t)     auxiliar variable to compute delays;';
gams{end+1}='BINARY VARIABLES';
gams{end+1}='zc(t,t,r,r,s) variable para evitar conflictos';
gams{end+1}='y(t,r)   set 1 if train t chooses the route r';
gams{end+1}=';';
gams{end+1}='EQUATIONS';
gams{end+1}='MIC1(t,t,r,r,s) conflictos tipo a';
gams{end+1}='MIC2(t,t,r,r,s) conflictos tipo a';
gams{end+1}='MIC3(t,t,r,r,s) conflictos tipo b';
gams{end+1}='MIC4(t,t,r,r,s) conflictos tipo b';
gams{end+1}='MIC5(t,t,r,r,s) conflictos tipo b';
gams{end+1}='MIC6(t,t,r,r,s) conflictos tipo b';
gams{end+1}='MIC7(t)  enrutamiento';
gams{end+1}='MIC8(t)  auxiliar1 para calcular retrasos en la llegada';
gams{end+1}='MIC9(t)  auxiliar2 para calcular retrasos en la llegada';
gams{end+1}='Fobj     funcion objetivo;';
gams{end+1}='MIC1(t1,t2,r1,r2,s)$(ca(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..w(t1)+L(t1,t2,r1,r2,s,''a1'')=g=w(t2)+L(t1,t2,r1,r2,s,''b2'')-M*zc(t1,t2,r1,r2,s)-M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC2(t1,t2,r1,r2,s)$(ca(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..w(t1)+L(t1,t2,r1,r2,s,''b1'')=l=w(t2)+L(t1,t2,r1,r2,s,''a2'')+M*(1-zc(t1,t2,r1,r2,s))+M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC3(t1,t2,r1,r2,s)$(cb(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..varepsilon+w(t1)+L(t1,t2,r1,r2,s,''a1'')=l=w(t2)+L(t1,t2,r1,r2,s,''a2'')+M*zc(t1,t2,r1,r2,s)+M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC4(t1,t2,r1,r2,s)$(cb(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..varepsilon+w(t1)+L(t1,t2,r1,r2,s,''b1'')=l=w(t2)+L(t1,t2,r1,r2,s,''b2'')+M*zc(t1,t2,r1,r2,s)+M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC5(t1,t2,r1,r2,s)$(cb(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..w(t1)+L(t1,t2,r1,r2,s,''a1'')=g=varepsilon+w(t2)+L(t1,t2,r1,r2,s,''a2'')-M*(1-zc(t1,t2,r1,r2,s))-M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC6(t1,t2,r1,r2,s)$(cb(t1,t2,r1,r2,s) and(ord(t1)<ord(t2)))..w(t1)+L(t1,t2,r1,r2,s,''b1'')=g=varepsilon+w(t2)+L(t1,t2,r1,r2,s,''b2'')-M*(1-zc(t1,t2,r1,r2,s))-M*(2-y(t1,r1)-y(t2,r2));';
gams{end+1}='MIC7(t)..sum(r$Rt(t,r),y(t,r))=e=1;';
gams{end+1}='MIC8(t)..D(t)=e=-pt(t)+dt(t)+sum(r$Rt(t,r),Ctr(t,r)*y(t,r));';
gams{end+1}='MIC9(t)..D(t)+w(t)=l=h(t);';
gams{end+1}='Fobj..OBJ=e=sum(t, u(t)*w(t)+v(t)*h(t));';

%newStr = replace(newStr,'/','\');
%newStr = replace(newStr,' ','');

newStr= replace(fileSalida,'./problemas','.')
newStr = replace(newStr,'.gms','_ini.gms');
gams{end+1}=['* $INCLUDE ' newStr ];
gams{end+1}='MODEL MICRO /ALL/;';
gams{end+1}='MICRO.OPTFILE=1;'; 
gams{end+1}='SOLVE MICRO USING mip MINIMIZING OBJ';
gams{end+1}='PUT ''----------------------------------'';PUT/;';
gams{end+1}='put ''            HORARIO'';put/;';
gams{end+1}='PUT ''----------------------------------'';PUT/';
gams{end+1}='LOOP(t,';
gams{end+1}='put t.tl, (dt(t)+w.l(t)), (D.l(t)+w.l(t)+pt(t));loop(r$y.l(t,r),put ''  '',r.tl;);put/;';
gams{end+1}=');';
gams{end+1}='put ''valor funcion objetivo'',OBJ.l;put/;';
gams{end+1}='put ''tiempo cpu'',MICRO.resusd;put/;';

% gams{end+1}='loop((t1,t2,r1,r2,s)$(ca(t1,t2,r1,r2,s) and(ord(t1)<ord(t2))),';
% gams{end+1}='put t1.tl,t2.tl,r1.tl,r2.tl,s.tl; put/;';
% gams{end+1}='put w.l(t1),L(t1,t2,r1,r2,s,''a1''),''=g='',w.l(t2),L(t1,t2,r1,r2,s,''b2''),(-M*zc.l(t1,t2,r1,r2,s)),(-M*(2-y.l(t1,r1)-y.l(t2,r2)));put/;';
% gams{end+1}='put w.l(t1),L(t1,t2,r1,r2,s,''b1''),''=l='',w.l(t2),L(t1,t2,r1,r2,s,''a2''),(M*(1-zc.l(t1,t2,r1,r2,s))),(M*(2-y.l(t1,r1)-y.l(t2,r2)));put/;';
% gams{end+1}=');';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     ESCRITURA DEL FICHERO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fd = fopen(fileSalida,'w');
if fd == -1
    display(sprintf('Cannot create file: %s', file));
else
    fprintf(fd, '%s \n',gams{:});
    fclose(fd);
% fichero de opciones
file_directory=[file_directory 'cplex.opt'];
fd = fopen(file_directory,'w');
texto_opt='mipstart=1';
fprintf(fd, '%s \n',texto_opt);
fclose(fd);


end
end
