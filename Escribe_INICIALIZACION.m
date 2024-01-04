function Escribe_INICIALIZACION(file_gams,t_opt, R,y_opt,dt1_opt,n_t)
fileSalida= replace(file_gams,'.gms','_ini.gms');
codigo={};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     ESCRITURA DEL FICHERO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fd = fopen(fileSalida,'w');

%%% escritura de rutas
 for t1=1:n_t
    codigo{end+1}=['y.l(''t' num2str(t1) ''',''r'  num2str(R{t1}(y_opt(t1))) ''')=1;' ];
   % fprintf(fd,' y.l(t %4i,%4i)=1;  \n', t_opt(t1),R{t1}(y_opt(t1)));
 end
%%% escritura de retrasos
 for t1=1:n_t
    codigo{end+1}=['w.l(''t' num2str(t1) ''')='  num2str(dt1_opt(t1),'%.6f') ';' ];
   % fprintf(fd,' y.l(t %4i,%4i)=1;  \n', t_opt(t1),R{t1}(y_opt(t1)));
 end


if fd == -1
    display(sprintf('Cannot create file: %s', file));
else
    fprintf(fd, '%s \n',codigo{:});
    fclose(fd);
end



