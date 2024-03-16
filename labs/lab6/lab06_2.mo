model lab06_2
Real N = 10300;
Real I;
Real R;
Real S;
Real alpha = 0.01;
Real beta = 0.02;
initial equation
I = 55;
R = 27;
S = N - I - R;
equation
der(S) = -alpha*S;
der(I) = alpha*S - beta*I;
der(R) = beta*I;
end lab06_2;