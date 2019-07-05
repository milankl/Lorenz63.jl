# Lorenz63.jl - A type-stable Lorenz 1963 system simulator

![attractor](figs/lorenz_attractor.png?raw=true "L63 attractor")

Lorenz63.jl simulates the Lorenz 1963 system for any given number system, as long as conversions (to and from Float64) and arithmetics (+,-,*,/) are defined. Output always in Float64.

# Usage

```julia
using Lorenz63
XYZ = L63()
```
simulates the Lorenz system with `Float64` and standard parameters. Providing the type (which has to be a subtype of `AbstractFloat`), returns the simulation calculated in that type (though output in `Float64`)

```julia
XYZ = L63(Float16)
```

Change parameters by specifying optional arguments

```julia
XYZ = L63(Float32,N=100_000,xyz=[1.0,0.0,0.0],σ=10.0,ρ=28.0,β=8/3,s=1.0,Δt=0.005,scheme="RK4")
```
with `N` the number of time steps, `xyz` the initial conditions, `σ,ρ,β` the conventional parameters of L63, `s` a scaling factor of the equations (that will be undone for storage), `Δt` the time step, and `scheme` the time integration scheme.
