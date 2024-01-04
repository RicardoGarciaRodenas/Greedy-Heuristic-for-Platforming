function main_EXPERIMENTOS()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESTA FUNCION GENERA LOS DATOS
%                               Y
% OBTIENE LOS RESULTADOS (GRAFICAS Y TABLAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear, clc,close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funcion permite generar los datos y representarlos. Hay que
% seleccionar la tarea a realizar y la opcion de la tarea elegida. Las
% posibilidades son:

TAREA='graficas'; % % {'genera_datos'}  |  % {'graficas'}  (resultados: tablas y gráficas)
OPCION_genera_datos='Sintetico'; %
% { 'Atocha_desde0'} Además de aplicar el heuristico sobre Atocha
%                ensaya inicializacione aleatorias para calcular los datos del
%                experimento inicializacion. Genera los problemas
% {'Atocha'} Repite el el experimetno de ATOCHA  pero no genera los problemas
% {'Sintetico'} Repite el el experimetno de Sintetico  pero no genera los problemas


OPCION_graficas='rendimientoSintetico'
% {'inicializacion'} --> efecto inicializacion realizado sobr Atocha
%{'rendimientoAtocha'}
%{'rendimientoSintetico'}-> graficos
%{'TablaSintetico'}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DEFINICION  DE LOS PROBLEMAS para 'Atocha'
%lista_file_name={'Problem4aS','Problem4bS','Problem4cS','Problem4a','Problem4b','Problem4c'};           %  PROBLEMA BASE
%lista_version={'a','b'};

% DEFINICION  DE LOS PROBLEMAS para 'Atocha
% lista_file_name={'Problem4aS'};
% lista_version={'b'};
% NREPLICAS=20;
% N_problemas=1;

%lista_file_name={'Problem2','Problem3'};
lista_file_name={'Problem2'}
lista_version={'b'};
NREPLICAS=20;
N_problemas=10;

switch  TAREA
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'genera_datos'
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        switch      OPCION_genera_datos
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 'Atocha'
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        %  tipos de error
                        NREPLICAS=1;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=1;                   %  Numero de problemas generados aeatoriamente

                        % procesamiento en orden
                        initia='orden';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='no' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem)

                        NREPLICAS=5;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=1;                   %  Numero de problemas generados aeatoria

                        % procesamiento aleatoria
                        initia='aleatoria';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='no' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem);

                    end
                end



                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 'Atocha_desde0'
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        %  tipos de error
                        NREPLICAS=1;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=1;                   %  Numero de problemas generados aeatoriamente

                        % procesamiento en orden
                        initia='orden';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='yes' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem)

                        NREPLICAS=20;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=1;                   %  Numero de problemas generados aeatoria

                        % procesamiento aleatoria
                        initia='aleatoria';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='no' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem);

                    end
                end

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 'Sintetico'
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        %  tipos de error
                        NREPLICAS=20;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=10;                   %  Numero de problemas generados aeatoriamente

                        % procesamiento en orden
                        initia='aleatoria';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='no' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem)


                        NREPLICAS=1;                     %  Numero de problemas del mismo tipo
                        NPROBLEMAS=10;                   %  Numero de problemas generados aeatoriamente

                        % procesamiento en orden
                        initia='orden';                    %  INICIALIZACION {'aleatoria' , 'orden' } (ordenada temporalmente)
                        new_problem='no' ;             % {'yes','no} crea un nuevo problem  o carga existente
                        heuristic(file_name,version,NREPLICAS,NPROBLEMAS,initia,new_problem)

                    end
                end
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'graficas'
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        file_directory_fig='./problemas/figures/';
        mkdir('./problemas','figures')
        switch      OPCION_graficas
            case 'inicializacion'
                n_figure=0;
                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        n_figure=n_figure+1;
                        figure(n_figure)
                        file_name=lista_file_name{i};
                        file_name
                        version=lista_version{j};
                        file_directory='./problemas/';
                        file_directory=[file_directory file_name '/resultados/'];
                        initia='aleatoria';
                        file_res=[file_directory file_name  '_' version '_aleatoria.mat' ]
                        load(file_res)
                        for n_replica=1:length(RES)

                            a1=plot(RES{1,n_replica}(:,1),RES{1,n_replica}(:,2),'s-b','LineWidth',2, 'MarkerSize',8);
                            hold on
                            xlabel('CPU (s)')
                            ylabel('Objective function')
                            grid on
                            ax=gca;
                            ax.FontSize=18;
                            %print(filname_fig,'-depsc')
                        end

                        file_res=[file_directory file_name  '_' version '_orden.mat' ]
                        load(file_res)

                        for n_replica=1:length(RES)
                            b1=plot(RES{1,n_replica}(:,1),RES{1,n_replica}(:,2),'-o','LineWidth',2, 'MarkerSize',12,'MarkerFaceColor',[1,0,0]);
                            hold on
                            xlabel('CPU (s)')
                            ylabel('Objective function')
                            grid on
                            ax=gca;
                            ax.FontSize=18;

                        end


                        if (strcmp(file_name,'Problem4a') || strcmp(file_name,'Problem4aS')) & version=='b'
                            leg=legend([b1 a1],'H_o','H_a','Orientation','horizontal')
                            leg.FontSize=25

                        end

                        aux=axis;
                        x_text=aux(1)+0.3*(aux(2)-aux(1));
                        y_text=aux(3)+0.95*(aux(4)-aux(3));
                        texto_insert=RENOMBRAR(file_name,version,[]);
                        text(x_text, y_text,texto_insert,"FontSize",22)

                        filname_fig=[file_directory_fig file_name  '_' version '_ini.eps' ]

                        print(filname_fig,'-depsc')
                    end
                end

            case 'rendimientoAtocha'
                tabla={}
                n_figure=0;
                fileSalidaTabla='./problemas/ProblemaTamaño.tex';
                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        clear ENTERAS
                        n_figure= n_figure+1;
                        figure(n_figure)
                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        file_directory='./problemas/';
                        file_directory=[file_directory file_name '/' ];
                        file_res=[file_directory file_name  '_' version '_replica1.log' ]
                        fd = fopen(file_res,'r');
                        N = textscan(fd,'%s', [inf,1]);
                        index=find(strcmp(N{:},'Found')==1)
                        for j=1:length(index)
                            ENTERAS(j,1)=str2num(N{:}{index(j)+6});
                            ENTERAS(j,2)=str2num(N{:}{index(j)+4});
                            a=index(j);
                            while not(contains(N{1}(a),'%'))

                                a=a+1;

                                if contains(N{1}(a),'possible:')
                                    a=a+3;
                                    break
                                end

                            end

                            ENTERAS(j,3)=str2num(N{:}{a-2});
                        end
                        %ENTERAS
                        % añadir la ultima cota encontrada al resolver LP si es optima

                        if length(find(strcmp(N{:},'status(101):')==1))

                            aux=find(strcmp(N{:},'(root+branch&cut)'));
                            ENTERAS(end+1,1)=str2num(N{:}{aux+2});
                            aux=find(strcmp(N{:},'Solution:'));
                            ENTERAS(end,2)=str2num(N{:}{aux+1});
                            aux=find(strcmp(N{:},'possible:'));
                            ENTERAS(end,3)=str2num(N{:}{aux+1});

                        end

                        xTICKS=[ENTERAS(1,1),ENTERAS(end,1)];
                        LB=ENTERAS(end,3);

                        rGAP_exa=[num2str(round(((ENTERAS(end,2)-LB)/LB)*100,1) ) '%'];
                        ENTERAS(:,2)
                        a1=plot(ENTERAS(:,1),ENTERAS(:,2),'-ko','LineWidth',2, 'MarkerSize',8,'MarkerFaceColor',[1,1,0])
                        hold on
                        b1=plot(ENTERAS(:,1),ENTERAS(:,3),'--k*','LineWidth',2, 'MarkerSize',8,'MarkerFaceColor',[1,1,0])

                        file_res=[file_directory 'Resultados/'  file_name  '_' version '_orden.mat' ];
                        load(file_res)
                        n_replica=1;

                        c1=plot(RES{1,n_replica}((end-1),1),RES{1,n_replica}((end-1),2),'-o','LineWidth',2, 'MarkerSize',12,'MarkerFaceColor',[1,0,0])
                        hold on
                        xlabel('CPU (s)')
                        ylabel('Objective function')
                        grid on
                        ax=gca;
                        ax.FontSize=18;
                        if (strcmp(file_name,'Problem4a') || strcmp(file_name,'Problem4aS')) & version=='b'
                            leg=legend([a1 b1 c1],'CPLEX','LB','H_o','Orientation','horizontal')
                            leg.FontSize=25
                        end

                        %ax.YLimitMethod='padded';
                        %ylim([0,10])
                        %xlim([0,20])
                        try
                            ax.XAxis.TickValues=round(sort([RES{1,n_replica}(end-1,1) xTICKS]),1);
                        catch
                            ax.XAxis.TickValues=round([RES{1,n_replica}(1,1) ENTERAS(end,1)],1);
                        end


                        rGAP_heu=[num2str(round(((RES{1,n_replica}(1,2) -LB)/LB)*100,1) ) '%'];% GAP relativo
                        aux=axis;
                        %axis(3)=aux(3)*0.9;
                        %axis(4)=aux(3)*1.1;
                        IncX=aux(2)-aux(1);
                        x_text=aux(1)+0.3*IncX;
                        y_text=aux(3)+0.95*(aux(4)-aux(3));
                        texto_insert=RENOMBRAR(file_name,version,[]);
                        %title(x_text, y_text,texto_insert,"FontSize",22)
                        title(texto_insert,"FontSize",22)
                        text(RES{1,n_replica}((end-1),1), RES{1,n_replica}((end-1),2) ,['  rGAP=' rGAP_heu],"FontSize",22,'HorizontalAlignment','left')
                        text(ENTERAS(end,1),ENTERAS(end,2) ,['  rGAP=' rGAP_exa],"FontSize",22,'HorizontalAlignment','right','VerticalAlignment','bottom')
                        %box off
                        %%% tamaño del problema
                        index=find(strcmp(N{:},'rows')==1);
                        ind=index(1);
                        rows=strrep(N{:}{ind-1} ,',' , '');
                        columns=strrep(N{:}{ind+1} ,',' , '');
                        nonzeroes=strrep(N{:}{ind+3} ,',' , '');
                        discretecolumns=strrep(N{:}{ind+6} ,',' , '');
                        tabla{end+1}=[TablaDimensiones(file_name,version) '  &  ' rows '  & ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']
                        %%% dimensiones tras el presolve del modelo
                        index=find(strcmp(N{:},'SOSs,')==1);
                        ind=index(end);
                        rows=strrep(N{:}{ind-15} ,',' , '');
                        columns=strrep(N{:}{ind-13} ,',' , '');
                        nonzeroes=strrep(N{:}{ind-10} ,',' , '');
                        discretecolumns=strrep(N{:}{ind-5} ,',' , '');
                        tabla{end+1}=[ ' &   &   &    &  ' rows '  &  ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']

                        % guardar los gráficos en un fichero


                        filname_fig=[file_directory_fig file_name  '_' version '.eps' ]
                        print(filname_fig,'-depsc')



                    end
                end
                fd = fopen(fileSalidaTabla,'w');
                if fd == -1
                    display(sprintf('Cannot create file: %s', file));
                else
                    fprintf(fd, '%s \n',tabla{:});
                    fclose(fd);

                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 'rendimientoSintetico'
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                tabla={}
                nProb=2; % elegir un problema de los 10 que se generan por tipos
                n_figure=0;
                fileSalidaTabla='./problemas/ProblemaTamaño.tex';
                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)
                        clear ENTERAS
                        n_figure= n_figure+1;
                        figure(n_figure)
                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        file_directory='./problemas/';
                        file_directory=[file_directory file_name '/' ];
                        file_res=[file_directory file_name  '_' version '_replica' num2str(nProb) '.log' ]
                        fd = fopen(file_res,'r');
                        N = textscan(fd,'%s', [inf,1]);
                        index=find(strcmp(N{:},'Found')==1)
                        for j=1:length(index)
                            ENTERAS(j,1)=str2num(N{:}{index(j)+6});
                            ENTERAS(j,2)=str2num(N{:}{index(j)+4});
                            a=index(j);
                            while not(contains(N{1}(a),'%'))

                                a=a+1;

                                if contains(N{1}(a),'possible:')
                                    a=a+3;
                                    break
                                end

                            end

                            ENTERAS(j,3)=str2num(N{:}{a-2});
                        end
                        %ENTERAS
                        % añadir la ultima cota encontrada al resolver LP si es optima

                        if length(find(strcmp(N{:},'status(101):')==1))

                            aux=find(strcmp(N{:},'(root+branch&cut)'));
                            ENTERAS(end+1,1)=str2num(N{:}{aux+2});
                            aux=find(strcmp(N{:},'Solution:'));
                            ENTERAS(end,2)=str2num(N{:}{aux+1});
                            aux=find(strcmp(N{:},'possible:'));
                            ENTERAS(end,3)=str2num(N{:}{aux+1});

                        end

                        xTICKS=[ENTERAS(1,1),ENTERAS(end,1)];
                        LB=ENTERAS(end,3);

                        rGAP_exa=[num2str(round(((ENTERAS(end,2)-LB)/LB)*100,1) ) '%'];
                        ENTERAS(:,2)
                        a1=plot(ENTERAS(:,1),ENTERAS(:,2),'-ko','LineWidth',2, 'MarkerSize',8,'MarkerFaceColor',[1,1,0])
                        hold on
                        b1=plot(ENTERAS(:,1),ENTERAS(:,3),'--k*','LineWidth',2, 'MarkerSize',8,'MarkerFaceColor',[1,1,0])

                        file_res=[file_directory 'Resultados/'  file_name  '_' version '_orden.mat' ];
                        load(file_res)
                        n_replica=1;

                        c1=plot(RES{nProb,n_replica}((end-1),1),RES{nProb,n_replica}((end-1),2),'-o','LineWidth',2, 'MarkerSize',12,'MarkerFaceColor',[1,0,0])
                        hold on
                        xlabel('CPU (s)')
                        ylabel('Objective function')
                        grid on
                        ax=gca;
                        ax.FontSize=18;
                        ax.YLimitMethod='padded';

                        if file_name=='Problem2' & version=='a'

                            ylim([0,20])
                            xlim([0,500])

                        elseif file_name=='Problem2' & version=='b'
                            ylim([0,8])
                            xlim([0,200])

                        elseif file_name=='Problem3' & version=='a'

                            ylim([0,300])
                            xlim([0,3600])

                        elseif file_name=='Problem3' & version=='b'
                            ylim([0,100])
                            xlim([0,3600])

                        end
                        if strcmp(file_name,'Problem2')  & version=='b'
                            leg=legend([a1 b1 c1],'CPLEX','LB','H_o','Orientation','horizontal')
                            leg.FontSize=25
                        end



                        rGAP_heu=[num2str(round(((RES{nProb,n_replica}(1,2) -LB)/LB)*100,1) ) '%'];% GAP relativo
                        aux=axis;
                        IncX=aux(2)-aux(1);
                        x_text=aux(1)+0.3*IncX;
                        y_text=aux(3)+0.95*(aux(4)-aux(3));
                        texto_insert=RENOMBRAR(file_name,version,nProb);
                        %title(x_text, y_text,texto_insert,"FontSize",22)
                        title(texto_insert,"FontSize",22)
                        text(RES{nProb,n_replica}((end-1),1), RES{nProb,n_replica}((end-1),2) ,['  rGAP=' rGAP_heu],"FontSize",22,'HorizontalAlignment','left')
                        text(ENTERAS(end,1),ENTERAS(end,2) ,['  rGAP=' rGAP_exa],"FontSize",22,'HorizontalAlignment','right','VerticalAlignment','bottom')
                        %box off
                        %%% tamaño del problema
                        index=find(strcmp(N{:},'rows')==1);
                        ind=index(1);
                        rows=strrep(N{:}{ind-1} ,',' , '');
                        columns=strrep(N{:}{ind+1} ,',' , '');
                        nonzeroes=strrep(N{:}{ind+3} ,',' , '');
                        discretecolumns=strrep(N{:}{ind+6} ,',' , '');
                        tabla{end+1}=[TablaDimensiones(file_name,version) '  &  ' rows '  & ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']
                        %%% dimensiones tras el presolve del modelo
                        index=find(strcmp(N{:},'SOSs,')==1);
                        ind=index(end);
                        rows=strrep(N{:}{ind-15} ,',' , '');
                        columns=strrep(N{:}{ind-13} ,',' , '');
                        nonzeroes=strrep(N{:}{ind-10} ,',' , '');
                        discretecolumns=strrep(N{:}{ind-5} ,',' , '');
                        tabla{end+1}=[ ' &   &   &    &  ' rows '  &  ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']

                        % guardar los gráficos en un fichero


                        filname_fig=[file_directory_fig file_name  '_' version 'replica_' num2str(nProb) '.eps' ]
                        print(filname_fig,'-depsc')



                    end
                end
                fd = fopen(fileSalidaTabla,'w');
                if fd == -1
                    display(sprintf('Cannot create file: %s', file));
                else
                    fprintf(fd, '%s \n',tabla{:});
                    fclose(fd);

                end



                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 'TablaSintetico'
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                tabla={}


                fileSalidaTabla='./problemas/ProblemaTamaño.tex';
                for i=1:length(lista_file_name)
                    for j=1:length(lista_version)

                        file_name=lista_file_name{i};
                        version=lista_version{j};
                        file_directory='./problemas/';
                        file_directory=[file_directory file_name '/' ];

                        file_res_tabla=[file_directory 'Resultados/'  file_name  '_' version '.tex' ];
                        fd_tabla = fopen(file_res_tabla,'w');
                        CStr={}; % contiene el texto para file_res_tabla
                        for k=1:N_problemas
                            clear ENTERAS

                            file_res=[file_directory file_name  '_' version '_replica' num2str(k)  '.log' ];
                            fd = fopen(file_res,'r');


                            N = textscan(fd,'%s', [inf,1]);
                            %%% cota inferior en cplex
                            aux=find(strcmp(N{:},'possible:'));
                            LB=str2num(N{:}{aux+1});
                            %%% tamaño del problema
                            if k==1
                                index=find(strcmp(N{:},'rows')==1);
                                ind=index(1);
                                rows=strrep(N{:}{ind-1} ,',' , '');
                                columns=strrep(N{:}{ind+1} ,',' , '');
                                nonzeroes=strrep(N{:}{ind+3} ,',' , '');
                                discretecolumns=strrep(N{:}{ind+6} ,',' , '');
                                tabla{end+1}=[TablaDimensiones(file_name,version) '  &  ' rows '  & ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']
                                %%% dimensiones tras el presolve del modelo
                                index=find(strcmp(N{:},'SOSs,')==1);
                                ind=index(end);
                                rows=strrep(N{:}{ind-15} ,',' , '');
                                columns=strrep(N{:}{ind-13} ,',' , '');
                                nonzeroes=strrep(N{:}{ind-10} ,',' , '');
                                discretecolumns=strrep(N{:}{ind-5} ,',' , '');
                                tabla{end+1}=[ ' &   &   &    &  ' rows '  &  ' columns '  &  ' discretecolumns '  &  ' nonzeroes  '  \\[-0.05in]']
                            end
                            %                          orden %%%%%%%%
                            file_res=[file_directory 'Resultados/'  file_name  '_' version '_orden.mat' ];
                            load(file_res);
                            n_replica=1;
                            rG_ho=((RES{k,1}(end-1,2) -LB)/LB)*100;
                            z_ho=RES{k,1}((end-1),2);
                            cpu_ho=RES{k,1}((end-1),1);
                            %                          aleatorios %%%%%%%%
                            file_res=[file_directory 'Resultados/'  file_name  '_' version '_aleatoria.mat' ];
                            clear RES
                            load(file_res)
                            for n_replica=1:NREPLICAS
                                rG_ha_aux(n_replica)=((RES{k,n_replica}(end-1,2) -LB)/LB)*100;
                                z_ha_aux(n_replica)=RES{k,n_replica}((end-1),2);
                                cpu_ha_aux(n_replica)=RES{k,n_replica}((end-1),1);
                            end

                            rG_ha=mean(rG_ha_aux);
                            z_ha=mean(z_ha_aux);
                            cpu_ha=mean(cpu_ha_aux);
                            [z_ha_min,I]=min(z_ha_aux);
                            rG_ha_min=rG_ha_aux(I);
                            cpu_ha_min=cpu_ha_aux(I);
                            %                        cplex %%%%%%%%%%%%%%%%%%%

                            index=find(strcmp(N{:},'Found')==1);
                            for j=1:length(index)
                                ENTERAS(j,1)=str2num(N{:}{index(j)+6});
                                ENTERAS(j,2)=str2num(N{:}{index(j)+4});
                                a=index(j);
                                while not(contains(N{1}(a),'%'))

                                    a=a+1;

                                    if contains(N{1}(a),'possible:')
                                        a=a+3;
                                        break
                                    end

                                end

                                ENTERAS(j,3)=str2num(N{:}{a-2});
                            end
                            ENTERAS
                            z1=ENTERAS(1,2);
                            cpu_z1=ENTERAS(1,1);
                            rG_z1=((z1-LB)/LB)*100;

                            z3600=ENTERAS(end,2);
                            cpu_z3600=ENTERAS(end,1);
                            rG_z3600=((z3600-LB)/LB)*100;


                            ind=find(z_ho<ENTERAS(:,2));

                            if length(ind)<size(ENTERAS,1)
                                ind_z=ind(end);
                                zi=ENTERAS(ind_z+1,2);
                                cpu_zi=ENTERAS(ind_z+1,1);
                                rG_zi=((zi-LB)/LB)*100;

                                %%%
                                CStr{end+1}=sprintf('Problem %2.0f    \t& $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ \\\\[-0.1in] \n ',k,z_ho,z_ha,z_ha_min,z1,zi,z3600);
                                CStr{end+1}=sprintf('  rGAP  \t& $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$  \\\\[-0.1in]  \n ',rG_ho,rG_ha,rG_ha_min,rG_z1,rG_zi,rG_z3600);
                                CStr{end+1}=sprintf(' CPU(s)  \t& $%8.1f$ & $%8.1f$ & $%8.1f$& $%8.1f$ & $%8.1f$ & $%8.1f$  \\\\  \n ',cpu_ho,cpu_ha,cpu_ha_min,cpu_z1,cpu_zi,cpu_z3600);
                            else
                                CStr{end+1}=sprintf('Problem %2.0f    \t& $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & -- & $%8.1f$ \\\\[-0.1in] \n ',k,z_ho,z_ha,z_ha_min,z1,z3600);
                                CStr{end+1}=sprintf('  rGAP  \t& $%8.1f$ & $%8.1f$ & $%8.1f$ & $%8.1f$ & -- & $%8.1f$  \\\\[-0.1in]  \n ',rG_ho,rG_ha,rG_ha_min,rG_z1,rG_z3600);
                                CStr{end+1}=sprintf(' CPU(s)  \t& $%8.1f$ & $%8.1f$ & $%8.1f$& $%8.1f$ & -- & $%8.1f$  \\\\  \n ',cpu_ho,cpu_ha,cpu_ha_min,cpu_z1,cpu_z3600);



                            end

                        end

                        fprintf(fd_tabla, '%s',CStr{:});
                        fclose(fd_tabla);
                    end


                    if fd == -1
                        display(sprintf('Cannot create file: %s', file));
                    else
                        fprintf(fd, '%s \n',tabla{:});
                        fclose(fd);

                    end
                end
        end

end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cambio de nombre para coincidir con el paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function name_new=RENOMBRAR(file_name,version,nProb)
file_name
version

switch version
    case 'a'
        switch  file_name
            case 'Problem4a'
                name_new='AtochaA-logn';
            case 'Problem4b'
                name_new='AtochaB-logn';
            case 'Problem4c'
                name_new='AtochaC-logn';
            case 'Problem4aS'
                name_new='AtochaSA-logn';
            case 'Problem4bS'
                name_new='AtochaSB-logn';
            case 'Problem4cS'
                name_new='AtochaSC-logn';
            case 'Problem2'
                name_new=['Experiment a. Problem ' num2str(nProb)];
            case 'Problem3'
                name_new=['Experiment c. Problem ' num2str(nProb)];
        end

    case 'b'
        switch  file_name
            case 'Problem4a'
                name_new='AtochaA-mn';
            case 'Problem4b'
                name_new='AtochaB-mn';
            case 'Problem4c'
                name_new='AtochaC-mn';
            case 'Problem4aS'
                name_new='AtochaSA-mn';
            case 'Problem4bS'
                name_new='AtochaSB-mn';
            case 'Problem4cS'
                name_new='AtochaSC-mn';
            case 'Problem2'
                name_new=['Experiment b. Problem ' num2str(nProb)];
            case 'Problem3'
                name_new=['Experiment d. Problem ' num2str(nProb)];
        end
end
end
%%%%%%%%%%%%%
% tabla dimensiones
%%%%%%%%%%%%%

function name_new=TablaDimensiones(file_name,version)
switch version
    case 'a'
        switch  file_name
            case 'Problem4a'
                name_new='AtochaA-logn&    C2, C7&             223 & All day';
            case 'Problem4b'
                name_new='AtochaB-logn&    C2, C7, C4, C3&     550 & All day';
            case 'Problem4c'
                name_new='AtochaC-logn&    C2, C7, C4, C3, C5  &849 & All day';
            case 'Problem4aS'
                name_new='AtochaSA-logn&C2, C7&                33 & [5,8]';
            case 'Problem4bS'
                name_new='AtochaSB-logn&   C2, C7, C4, C3&     89 & [5,8]';
            case 'Problem4cS'
                name_new='AtochaSC-logn&   C2, C7, C4, C3, C5& 132 & [5,8] ';
            case 'Problem2'
                name_new='Problem 1.a.1  ';
            case 'Problem3'
                name_new='Problem 2.a.1 ';
        end
    case 'b'
        switch  file_name
            case 'Problem4a'
                name_new='AtochaA-mn&    C2, C7&             223 & All day';
            case 'Problem4b'
                name_new='AtochaB-mn&    C2, C7, C4, C3&     550 & All day';
            case 'Problem4c'
                name_new='AtochaC-mn&    C2, C7, C4, C3, C5  &849 & All day';
            case 'Problem4aS'
                name_new='AtochaSA-mn&C2, C7&                33 & [5,8]';
            case 'Problem4bS'
                name_new='AtochaSB-mn&   C2, C7, C4, C3&     89 & [5,8]';
            case 'Problem4cS'
                name_new='AtochaSC-mn&   C2, C7, C4, C3, C5& 132 & [5,8] ';
            case 'Problem2'
                name_new='Problem 1.b.1  ';
            case 'Problem3'
                name_new='Problem 2.b.1 ';
        end
end
end
