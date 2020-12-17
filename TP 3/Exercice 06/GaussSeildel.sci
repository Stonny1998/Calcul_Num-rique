
s=10
rand("seed",s)

//initialisation des tailles des matrices

n = 5


B = rand(n,n)
A = zeros(n,n)

  for k=1:n
     A(k,k) = B(k,k); 
    if k<n
        A(k+1,k) = B(k+1,k);
        A(k,k+1) = B(k,k+1);
    end
end

disp(A)


b=[-1 2 3 0.5]'
x=[0 0 0 0]'
n=size(x,1);
normVal=Inf; 

tol=1e-5; itr=0;

while normVal>tol
    x_old=x;
    
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=norm(x_old-x);
end

fprintf('Solution of the system is : \n%f\n%f\n%f\n%f in %d iterations',x,itr);
