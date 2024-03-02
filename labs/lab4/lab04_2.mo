model DampedOscillatorWithoutExternalForce
  // Определение переменных состояния
  Real x(start=0.5); // Начальное условие для смещения
  Real v(start=1.0); // Начальное условие для скорости
initial equation
  // Начальные условия определены выше
equation
  der(x) = v; // Первое уравнение системы, связывающее скорость и смещение
  der(v) = -2*x - 11*v; // Второе уравнение системы, основанное на уравнении осциллятора
end DampedOscillatorWithoutExternalForce;
