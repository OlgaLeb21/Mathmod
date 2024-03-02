using DifferentialEquations
using Plots

function forced_damped_oscillator!(dx, x, params, t)
    dx[1] = x[2]
    dx[2] = 2*cos(2*t) - 2*x[1] - 21*x[2]
end

x0 = [0.5, 1.0]  # Начальные условия для смещения и скорости
tspan = (0.0, 10.0)  # Диапазон времени

prob = ODEProblem(forced_damped_oscillator!, x0, tspan)
sol = solve(prob)

# Визуализация решения
plot(sol, title="Damped Harmonic Oscillator with External Force", xlabel="Time", ylabel="Position / Velocity", label=["x" "v"], linewidth=2)
savefig("oscillator_solution_julia.png")

# Визуализация фазового портрета
plot(sol, vars=(1,2), title="Phase Portrait", xlabel="Position", ylabel="Velocity")
savefig("oscillator_phase_portrait_julia.png")
