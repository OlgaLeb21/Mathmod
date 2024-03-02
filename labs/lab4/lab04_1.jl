
using DifferentialEquations, Plots

function oscillator1!(du, u, p, t)
    du[1] = u[2]
    du[2] = -12*u[1]

u0 = [0.5, 1.0]   
tspan = (0.0, 51.0) 

prob1 = ODEProblem(oscillator1!, u0, tspan)
sol1 = solve(prob1, Tsit5(), reltol=1e-8, abstol=1e-8)

plot(sol, title = "Harmonic Oscillator without Damping", xlabel = "Time", ylabel = "Position/Velocity")
savefig("oscillator1_solution.png")