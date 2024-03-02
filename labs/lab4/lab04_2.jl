using DifferentialEquations, Plots

function oscillator2!(du, u, p, t)
    du[1] = u[2]
    du[2] = -2*u[1] - 11*u[2]
end

u0 = [0.5, 1.0]
tspan = (0.0, 5.0)

prob2 = ODEProblem(oscillator2!, u0, tspan)
sol2 = solve(prob2, Tsit5(), reltol=1e-8, abstol=1e-8)

plot(sol2, title="Damped Harmonic Oscillator without External Force", xlabel="Time", ylabel="Position / Velocity")
savefig("oscillator2_solution.png")

plot(sol2, vars=(1,2), title="Phase Portrait", xlabel="Position", ylabel="Velocity")
savefig("oscillator2_phase_portrait.png")
