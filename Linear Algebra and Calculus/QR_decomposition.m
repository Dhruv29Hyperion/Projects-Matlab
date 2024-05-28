function [QF,RF] = QR_decomposition(A)

[~,n] = size(A);

[~,rank] = r_r_e_f(A);

if rank ~= n 
    disp("Factorization doesn't exixt.")

else
    Q = [];
    R = zeros(n,n);
    v = A(:,1);
    u = v/(norm(v,2));
    Q;
    for i = 2:n 
        v = zeros(n,1);
        parlv = 0;
        u = zeros(n,1);
        for j = 1:i-1
            parlv = parlv + Q(:,j)'*A(:,i)*Q(:,j);
        end
        v = A(:,i) - parlv;
        u = v/(norm(v,2));
        Q = [Q u];
    end
    for i = 1:n 
        for j = i:n 
            R(i,j) = round(dot(Q(:,j),A(:,j)));
        end
    end
end
format rational

QF = Q;
RF = R;
