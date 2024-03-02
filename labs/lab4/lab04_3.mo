model ForcedDampedOscillator
  // Определение переменных состояния
  Real x(start=0.5); // Начальное условие для смещения
  Real v(start=1.0); // Начальное условие для скорости
equation
  der(x) = v; // Первое уравнение системы, связывающее скорость и смещение
  der(v) = 2*cos(2*time) - 2*x - 21*v; // Второе уравнение системы, включающее внешнюю силу
end ForcedDampedOscillator;
