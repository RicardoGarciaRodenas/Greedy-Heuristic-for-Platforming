% Hay tres ficheros para generar 3 problemas
%------------------------------------------------
% PROBLEMAS DE PEQUEÑAS DIMENSIONES
% Se han seleccionado todos los trenes hasta la 8 de la mañana
% se encuentra en la hoja excel horarios_small.xlsx
DAT=importdata('horarios_small.xlsx');% problema pequeño

% MainGenerarA.m -> Genera el Problem4aS lineas C2 y C7
% MainGenerarB.m -> Genera el Problem4bS lineas C2 , C7 , C4 y C3
% MainGenerarA.m -> Genera el Problem4aS lineas C2 , C7 , C4 , C3 y C5

% PROBLEMAS GRANDES (HORARIOS DE TODO EL DIA)
% En este caso se lee el horario completo de la hoja excel horarios.xlsx 
DAT=importdata('horarios.xlsx')

% MainGenerarA_completo.m -> Genera el Problem4a lineas C2 y C7
% MainGenerarB_completo.m -> Genera el Problem4b lineas C2 , C7 , C4 y C3
% MainGenerarA_completo.m -> Genera el Problem4a lineas C2 , C7 , C4 , C3 y C5