model lab05_2
Real a = 0.69;
Real b = 0.068;
Real c = 0.67;
Real d = 0.066;
Real x;
Real y;
initial equation
x = c / d;
y = a / b;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;
end lab05_2;