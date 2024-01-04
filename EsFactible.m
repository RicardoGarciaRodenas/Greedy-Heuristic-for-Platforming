function w=EsFactible(w,A,k)
% w conjunto de w tentativos
% A matriz de intervalos prohibidos. Cada intervalo puesto en fila
% k+1 es la primera fila que se analiza la factibilidad

for j=k+1:size(A,1)
    a=A(j,1);
    b=A(j,2);
    w=w(find( not( w>a & w<b)));
end

end