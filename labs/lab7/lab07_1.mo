model lab07_1
Real N = 741;
Real n;
initial equation
n = 4;
equation
der(n) = (0.63 + 0.00013*n)*(N-n);
end lab07_1;