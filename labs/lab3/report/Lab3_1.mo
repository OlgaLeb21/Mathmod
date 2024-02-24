model Lab3_1

Real x;
Real y;
Real a = 0.71;
Real b = 0.85;
Real c = 0.59;
Real h = 0.73;
Real t = time;

initial equation
x = 20850;
y = 9900;

equation
der(x) = -a*x - b*y + sin(6*t) + 1;
der(y) = -c*x - h*y + cos(7*t) + 1;

end Lab3_1;
