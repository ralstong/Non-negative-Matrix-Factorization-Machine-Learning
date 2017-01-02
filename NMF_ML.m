load('faces.mat')
%W is a nxK matrix, where rank is K=25
W = rand(1024,25);
%H is a Kxm matrix
H = rand(25,1000);

%Implementing the NMF algorithm on the data using Euclidean penalty
for t = 1:200
    Num_H = transpose(W)*X;
    Den_H = transpose(W)*W*H;
    Den_H = Den_H + 1e-16;
    
    Num_W = X*transpose(H);
    Den_W = W*H*transpose(H);
    Den_W = Den_W + 1e-16;
    
    for k=1:25
        for j = 1:1000
            H(k,j) = H(k,j)*(Num_H(k,j)/Den_H(k,j));
        end
    end
    
    for i = 1:1024
        for k = 1:25
            W(i,k) = W(i,k)*(Num_W(i,k)/Den_W(i,k));
        end
    end
    
    WH = W*H;
    %obj_fn(t) = (norm(X-WH))^2;    
    obj_fn(t) = 0;
    for i=1:1024
        for j=1:1000
            obj_fn(t) = obj_fn(t) + (X(i,j)-WH(i,j))^2;
        end
    end
    
    t
end

%Plotting the objective function
figure (1)
x = 1:200;
plot(x,obj_fn);
xlabel('t');
ylabel('Objective function value');
title('Objective function value for 200 iterations');

% [max_1 max_1_idx] = max(H(1,:));
% figure(2)
% imshow(mat2gray(reshape(W(:,1),[32,32])))
% figure(3)
% imshow(mat2gray(reshape(X(:,max_1_idx),[32,32])))
% and this continues for 9 other values
