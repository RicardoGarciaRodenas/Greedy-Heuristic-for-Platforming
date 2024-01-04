function t_pla_perturbado=SimulacionRetraso(t_pla,version)
%t_pla=[5.233 ; 5.417 ; 5.700 ; 5.900 ; 6.050 ; 6.250 ; 6.633 ; 6.883 ; 7.133 ; 7.350 ; 7.500 ; 7.850 ; 7.967 ; 5.217 ; 6.500 ; 6.717 ; 7.000 ; 7.700 ; 5.983 ; 6.267 ; 6.517 ; 6.750 ; 6.983 ; 7.167 ; 7.367 ; 7.567 ; 7.750 ; 7.967 ; 6.433 ; 6.650 ; 6.933 ; 7.633 ; 7.950  ]; 
%hist(t_pla,5)
% Media y desviacion tipica de los retrasos

if version=='a'
m=10/60; % media 1 minuto
v=1;   % desviación típica 0.1 horas
% CALCULO DE LOS PARAMETROS DE LA LOG-NORMAL PARA OBTENER LA ANTERIOR
% MEDIA Y DESVIACION TIPICA
mu=log(m^2/sqrt(v+m^2));
sigma=sqrt(log(v/m^2+1));
delay = lognrnd(mu,sigma,[1,length(t_pla)]);
elseif version=='b' 
    p=[0.75 0.05 0.05 0.05 0.05 0.05];
    pd = makedist('Multinomial','probabilities',p);
    %rng('default'); para la reproducibilidad
    delay = random(pd,1,length(t_pla))*1/60;
end

t_pla_perturbado=t_pla+delay';


% mean(r1)
% std(r1)
% hist(r1,5)
% r1(find(r1*60>1))*60
% min_r1=min(r1)*60
% max_r1=max(r1)*60
% r2 = lognrnd(mu,sigma,[1,1000]);
% mean(r2*60)
% std(r2*60)
end