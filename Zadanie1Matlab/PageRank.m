clear all
close all

Edges = [ 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;
          4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6 ];

N = 7;
d = 0.85;

B = sparse(Edges(2,:),Edges(1,:),ones,N,N);

I = speye(N);

L = sum(B);

IL = 1./L;

A = spdiags(IL',0,N,N);

M = sparse(I - d*B*A);

b=ones(N,1)*(1-d)/N;

whos A B I M b

spy(B)
title("Połączenia w grafie")
print -dpng spy_b

figure;

r = M\b;

bar(r)
title("Wartości Page Rank dla stron")
xlabel("Numer strony")
ylabel("Wartość Page Rank")
print -dpng bar