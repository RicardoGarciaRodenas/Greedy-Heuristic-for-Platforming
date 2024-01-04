function X=Rfactible(c)
% c es un cell c{i} matriz de intervalos prohibidos por los conflictos
% X matriz conteniendo los intervalos prohibidos
bandera=0;
n=length(c);
for i=1:n-1
for j=1:size(c{i},1)
    
    A=c{i}(j,:);
    for k=1:size(c{i+1},1)
        %B=c{i+1}(k,:);
        %test=A(2)-A(1)+B(2)-B(1)-max(A(2),B(2))+min(A(1),B(1));
        
        test=A(2)-A(1)+c{i+1}(k,2)-c{i+1}(k,1)-max(A(2),c{i+1}(k,2))+min(A(1),c{i+1}(k,1));
        if test >0
            %c{i+1}(k,:)=[min(A(1),B(1)),max(A(2),B(2))];
            c{i+1}(k,:)=[min(A(1),c{i+1}(k,1)),max(A(2),c{i+1}(k,2))];
            bandera=1;
            break
        end       
    end
    if bandera==1
        bandera=0;
    else
        c{i+1}=[c{i+1};A];
    end
end

end
%X=c{n};
Xaux=sort(c{n});
X=[];
j=1;
for i=1:size(Xaux)
    if (Xaux(i,1)<=0 && Xaux(i,2)>0) ||(Xaux(i,1)>=0 && Xaux(i,2)>0)
        X(j,:)=Xaux(i,:);
        j=j+1;
    end    
end
Y=[];
for i=1:size(X,1)-1
    A=X(i,:);
    B=X(i+1,:);
    test=A(2)-A(1)+B(2)-B(1)-max(A(2),B(2))+min(A(1),B(1));
    if test >0
        X(i+1,:)=[min(A(1),B(1)),max(A(2),B(2))];
    else
        Y(end+1,:)=A;   
       
    end
end
if size(X,1)>=1
Y(end+1,:)=X(end,:); 
else
    Y=[0,0];
end
X=Y;

end