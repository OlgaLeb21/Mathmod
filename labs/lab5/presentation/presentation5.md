---
## Front matter
lang: ru-RU
title: "Лабораторная работа №5. Модель хищник-жертва" 
subtitle: 
author: |
        Выполнила: Лебедева Ольга Андреевна
        \
        Преподаватель Кулябов Дмитрий Сергеевич д.ф.-м.н.,
        \ 
        профессор кафедры теории вероятностей и кибербезопасности
institute: |
           Российский университет дружбы народов, Москва, Россия
date: |
      2024

babel-lang: russian
babel-otherlangs: english
mainfont: Arial
monofont: Courier New
fontsize: 8pt

## Formatting
toc: false
slide_level: 2
theme: metropolis
header-includes: 
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
aspectratio: 43
section-titles: true
---

## Цель работы

Построить простейшую модель взаимодействия двух видов типа «хищник — жертва» - модель Лотки-Вольтерры.

## Теоретическое введение

Модель Лотки-Вольтерры является классическим примером математической модели взаимодействия между хищниками и их жертвами в экологии. Названная в честь двух итальянских ученых, Альфредо Лотки и Витторио Вольтерры, она представляет собой систему дифференциальных уравнений, которые описывают динамику популяций обоих видов во времени.

В модели учитывается два вида организмов: хищники и их жертвы. Предполагается, что популяции обоих видов развиваются в изолированной среде без внешних влияний [1].

## Задание

<i>Вариант 17 </i>

Для модели «хищник-жертва»:

$$
\begin{cases}
\frac{dx}{dt} = -0.69x(t) + 0.068x(t)y(t) \\
\frac{dy}{dt} = 0.67y(t) - 0.066x(t)y(t)
\end{cases}
$$

Постройте график зависимости численности хищников от численности жертв,
а также графики изменения численности хищников и численности жертв при
следующих начальных условиях x<sub>0</sub> = 4, y<sub>0</sub> = 11. 
Найдите стационарное состояние системы.

# Выполнение лабораторной работы

## Julia

Напишем код на Jilia для случая 1: нестационарное состояние системы. 

    using Plots, DifferentialEquations

    x0 = 4
    y0 = 11

    a = 0.69
    b = 0.068
    c = 0.67
    d = 0.66

    function ode_fn(du, u, p, t)
        x, y = u
        du[1] = -a * u[1] + b * u[1] * u[2]
        du[2] = c * u[2] - d * u[1] * u[2]
    end
## Julia
    v0 = [x0, y0]
    tspan = (0.0, 60.0)
    prob = ODEProblem(ode_fn, v0, tspan)
    sol = solve(prob, dtmax=0.05)
    X = [u[1] for u in sol.u]
    Y = [u[2] for u in sol.u]
    T = [t for t in sol.t]

    plt = plot(dpi=300, legend=false)
    plot!(plt, X, Y, color=:blue)
    savefig(plt, "lab05_1.png")

    plt2 = plot(dpi=300, legend=true)
    plot!(plt2, T, X, label="Численность жертв", color=:red)
    plot!(plt2, T, Y, label="Численность хищников", color=:green)
    savefig(plt2, "lab05_2.png")

## Julia

Запустим код при помощи командной строки и получим два изображения: Cм. [рис. 1](#fig:001), Cм. [рис. 2](#fig:002)

![Динамика популяций хищников относительно жертв](lab05_1.png){ #fig:001 width=70% }

## Julia

![Изменение популяций хищников и жертв по времени](lab05_2.png){ #fig:002 width=70% }

## Julia

Напишем код на Jilia для случая 2: стационарное состояние системы. 

    using Plots, DifferentialEquations

    a = 0.69
    b = 0.068
    c = 0.67
    d = 0.66 

    x0 = c / d 
    y0 = a / b

    function ode_fn(du, u, p, t)
        x, y = u
        du[1] = -a * u[1] + b * u[1] * u[2]
        du[2] = c * u[2] - d * u[1] * u[2]
    end

## Julia

    v0 = [x0, y0]
    tspan = (0.0, 60.0)
    prob = ODEProblem(ode_fn, v0, tspan)
    sol = solve(prob, dtmax=0.05)
    X = [u[1] for u in sol.u]
    Y = [u[2] for u in sol.u]
    T = [t for t in sol.t]

    plt2 = plot(dpi=300, legend=true)
    plot!(plt2, T, X, label="Численность жертв", color=:red)
    plot!(plt2, T, Y, label="Численность хищников", color=:green)
    savefig(plt2, "lab05_3.png")
 
## Julia

Запустим код при помощи командной строки и получим изображениe: Cм. [рис. 3](#fig:003)

![Стационарное состояние системы](lab05_3.png){ #fig:003 width=70% }

В стационарном состоянии решение будет представлять собой точку.

## OpenModelica

Напишем код на OpenModelica для случая 1: нестационарное состояние системы. 

    model PredatorPrey
    parameter Real a = 0.69;
    parameter Real b = 0.068;
    parameter Real c = 0.67;
    parameter Real d = 0.66;

    parameter Real x0 = 4;
    parameter Real y0 = 11;

    Real x(start = x0);
    Real y(start = y0);

    equation
    der(x) = -a * x + b * x * y;
    der(y) = c * y - d * x * y;

    end PredatorPrey;

## OpenModelica

Запустим код при помощи кнопок "проверить модель" -> "установки симуляции" -> "симулировать". Не забываем в найстройках указать заданные нам начальные условия Cм. [рис. 4](#fig:004), Cм. [рис. 5](#fig:005)

![Динамика популяций хищников относительно жертв](OM_1.jpg){ #fig:004 width=70% }

## OpenModelica

![Изменение популяций хищников и жертв по времени](OM_2.jpg){ #fig:005 width=70% }

## OpenModelica

Напишем код для случая 2: стационарное состояние системы.

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
 
## OpenModelica

Запустим код. Нажимаем галочки x и v для отображения графиков: Cм. [рис. 6](#fig:006)

![Стационарное состояние системы](OM_3.jpg){ #fig:006 width=70% }

## Заключение

 Построили простейшую модель взаимодействия двух видов типа «хищник — жертва» - модель Лотки-Вольтерры.

## Библиографическая справка 

[1] Модель хищник-жертва: https://math-it.petrsu.ru/users/semenova/MathECO/Lections/Lotka_Volterra.pdf