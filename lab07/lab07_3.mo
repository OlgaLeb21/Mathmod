
model lab07_3
Real N = 741;
Real n;
initial equation
n = 4;
equation
der(n) = (0.65 * sin(7*time) + cos(3*time)*n)*(N-n);
end lab07_3;
