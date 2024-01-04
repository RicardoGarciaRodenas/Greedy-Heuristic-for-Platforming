function heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     G e n e r a c i ó n   /   l e c t u r a   d e l   p r o b l e m a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem1 es el problema pequeño para depurar los datos
% Problem2 Y Problem3 es la red pequeña con 8 rutas
% Problem4a caso real de ATOCHA
% Problem4b caso real de ATOCHA
% Problem4c caso real de ATOCHA
% Problem4aS caso real de ATOCHA
% Problem4bS caso real de ATOCHA
% Problem4cS caso real de ATOCHA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% creacion de directorios por cada problema
file_directory='./problemas/';
file_directory=[file_directory file_name '/'];

if strcmp(new_problem,'yes')
    mkdir(file_directory)
    mkdir([ file_directory '/resultados/']);
end

for n_prob=1:NPROBLEMAS
    id='replica';                   %  replicacion del problema tipo
    id=[id num2str(n_prob)];
    file_dat= [file_directory file_name '_' version '_' id '.MAT'];
    file_gams=[file_directory file_name '_' version '_' id '.gms'];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch new_problem
        case 'yes'
            Genera_PROBLEMA_v3(file_directory,file_name,version,id)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%     E s c r i t u r a   p r o b l e m a   e n   g a m s
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            load(file_dat);

            Escribe_GAMS(file_gams,t_pla,n_rutas,n_s,n_t,R,C_t,Marcha,D_t,at,id,file_name,file_directory);
        case'no'
            load(file_dat);
    end

    for n_replica=1:NREPLICAS

        RES{n_prob,n_replica}=[]; % Almacenamiento de resultados


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% inicalizacion de variables
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        tic
        iter=0;
        for i=1:n_t
            y(i)=randi(length(R{i}));
        end

        bandera=1;
        Z_opt=+Inf;

        while bandera

            iter=iter+1;
            t=t_pla;     % departure time inicial
            z=0;         % valor de la función objetivo de la solución

            if strcmp(initia,'orden')
                orden_alea=1:n_t;
            elseif strcmp(initia,'aleatoria');
                orden_alea=randperm(n_t);
            end

            for t1_aux=1:n_t

                t1=orden_alea(t1_aux);
                dt1(t1)=Inf;    % demora en el tren t1
                z_t1=Inf; % valor de la mejor decision para el tren t1
                %fprintf('---------------------------------------------------------------------------\n');
                %fprintf('                          tren      =  %6.0f  \n',t1);
                %fprintf('---------------------------------------------------------------------------\n');
                for i_r1=1:length(R{t1})
                    %fprintf('======  ruta = %4.0f    =====\n',R{t1}(i_r1));

                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    % inicializacion parámetros calcular la mejor ruta
                    z_ruta=Inf; % retraso potencial en el tren t1
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    % retraso en t1 debido a los trenes ya decididos
                    [w1_factible]=w1factibles(t1_aux,i_r1,D_t,C_t,t,n_t,R,y,Marcha,orden_alea);                   
                    w1_tentativos=w1tentativos(w1_factible,t1_aux,i_r1,D_t,C_t,t,n_t,R,y,Marcha,t_pla,TVr,vt,orden_alea);
                    [w1_fijo,z_ruta]=fijar_dt(t1_aux,w1_tentativos,D_t,C_t,t,n_t,i_r1,y,R,Marcha,orden_alea);
                    if z_ruta<z_t1
                        z_t1=z_ruta;
                        dt1(t1)=w1_fijo;
                        y(t1)=i_r1;
                    end
                end % de rutas
                % contribucion del tren t1
                t(t1)=t(t1)+dt1(t1);
                D_t1=TVr(r1)*vt(t1)+t(t1)-at(t1);
                z_t1=t(t1)-t_pla(t1)+ max(D_t1,0);
                z_t1_aux(t1)=z_t1;
                z=z+z_t1;
                %     fprintf('---------------------------------------------------------------------------\n');
                %     fprintf('       r e s u m e n   d e l   t r e n      =  %6.0f  \n',t1);
                %     fprintf('---------------------------------------------------------------------------\n');
                %     fprintf('ruta =%3.0f \t t_depar =%3.1f  dt1(t1) =%3.3f  z1=%4.2f z=%4.2f \n',R{t1}(y(t1)),t(t1),dt1(t1),z_t1,z);

            end
            % fprintf('*******************************************\n');
            % fprintf('*********** VALOR DE LA SOLUCION  =  %4.2f \n',z);
            % fprintf('*******************************************\n');
            % for t1=1:n_t
            %     fprintf('tren = %3.0f salida = %4.2f ruta = %3.0f  \n',t1, t(t1),R{t1}(y(t1)));
            % end

            if z<Z_opt
                bandera=1;
                Z_opt=z;
                y_opt=y;
                t_opt=t;
                dt1_opt=dt1;
                CPU_opt=toc;
            else
                bandera=0;
                CPU_opt=toc;
                dt1=[];
            end
            % desactivar para ver la evolucion de los algoritmos
            fprintf(' iter = %3.0f  cpu = %5.2f Z = %8.3f  \n',iter,CPU_opt,z);

            RES{n_prob,n_replica} =[RES{n_prob,n_replica} ;[CPU_opt z]];

        end
        toc

%         % desactivar para ver la solucion final
        fprintf('*******************************************\n');
        fprintf('*********** VALOR DE LA SOLUCION  =  %4.2f \n',Z_opt);
        fprintf('*******************************************\n');


        CPU(n_prob,n_replica)=RES{n_prob,n_replica}(end-1,1);
        Z(n_prob,n_replica)=RES{n_prob,n_replica}(end-1,2);
    end
end

file_tex=[file_directory 'resultados/' file_name '_' version '_' initia  '.tex']
EscribeTablaLatex_y_RES(file_tex,CPU,Z,RES);
switch new_problem
    case 'yes'
        Escribe_INICIALIZACION(file_gams,t_opt, R,y_opt,dt1_opt,n_t)
end
end