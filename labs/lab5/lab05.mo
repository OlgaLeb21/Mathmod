model PredatorPrey
  // Параметры модели
  parameter Real a = 0.69;
  parameter Real b = 0.068;
  parameter Real c = 0.67;
  parameter Real d = 0.66;

  // Начальные условия
  parameter Real x0 = 4;
  parameter Real y0 = 11;

  // Переменные состояния
  Real x(start = x0);
  Real y(start = y0);

equation
  // Описываем систему ОДУ
  der(x) = -a * x + b * x * y;
  der(y) = c * y - d * x * y;

end PredatorPrey;