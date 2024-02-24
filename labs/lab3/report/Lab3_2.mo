model Lab3_2

Real x;
Real y;
Real a = 0.71;
Real b = 0.81;
Real c = 0.59;
Real d = 0.73;
Real t = time;

initial equation
x = 20850;
y = 9900;

equation
der(x) = -a*x - b*y + 1.5*sin(2*t);
der(y) = -c*x*y - d*y + 1.5*cos(t);

end Lab3_2;
