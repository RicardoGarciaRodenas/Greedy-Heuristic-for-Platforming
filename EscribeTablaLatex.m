function EscribeTablaLatex(fileSalida,CPU,Z)
CStr={};
CStr{end+1}='\begin{table}';
CStr{end+1}='\caption{Resultados numéricos con el Experimento 1.a \label{Expe1a}}';
CStr{end+1}='\begin{tabular}{|c|cccc|c|}';
CStr{end+1}='\hline ';
CStr{end+1}='&&\multicolumn{3}{c}{\bf Heuristic algorithm}&\multirow{3}{*}{\bf  CPLEX}\\';
CStr{end+1}='\cline{2-5}';
CStr{end+1}='\multirow{2}{*}{\bf Problem }&& {\bf  Best  }& {\bf Average }&{\bf  Standard }&\\';
CStr{end+1}='  & &  {\bf Value }&{\bf  Value }&{\bf  Deviation}&\\';
CStr{end+1}='\hline';

for i=1:size(Z,1)
    min_Z=min(Z(i,:));
    mean_Z=mean(Z(i,:));
    std_Z=std(Z(i,:));
    min_CPU=min(CPU(i,:));
    mean_CPU=mean(CPU(i,:));
    std_CPU=std(CPU(i,:));
    CStr{end+1}=sprintf('Problem  %2.0f\t &$z$   \t& $%8.2f$ & $%8.2f$ & $%8.2f$ \\\\ ',i  ,min_Z ,mean_Z,std_Z);
    CStr{end+1}=sprintf('\t\t\t\t&CPU \t &($%8.2f$s.) & ($%8.2f$ s.) & ($%8.2f$ s.) \\\\ \\hline ' ,min_CPU ,mean_CPU,std_CPU);
    
end
CStr{end+1}='\hline';
CStr{end+1}='\end{tabular}';
CStr{end+1}='\end{table}';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     ESCRITURA DEL FICHERO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fd = fopen(fileSalida,'w');
if fd == -1
    display(sprintf('Cannot create file: %s', fileSalida));
else
    fprintf(fd, '%s \n',CStr{:});
    fclose(fd);
end


end

