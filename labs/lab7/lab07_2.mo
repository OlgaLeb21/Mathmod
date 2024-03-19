model lab07_2
Real N = 741;
Real n;
initial equation
n = 4;
equation
der(n) = (0.000035 + 0.95*n)*(N-n);
end lab07_2;
