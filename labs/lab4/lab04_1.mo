model HarmonicOscillatorWithoutDamping
  Real x(start=0.5);
  Real v(start=1.0);
equation
  der(x) = v;
  der(v) = -12*x;
end HarmonicOscillatorWithoutDamping;
