[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://travis-ci.com/milankl/Lorenz63.jl.svg?branch=master)](https://travis-ci.com/milankl/Lorenz63.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/fbe7bvd6gs1qp9fy?svg=true)](https://ci.appveyor.com/project/milankl/lorenz63-jl)
[![Build Status](https://api.cirrus-ci.com/github/milankl/Lorenz96.jl.svg)](https://cirrus-ci.com/github/milankl/Lorenz96.jl)

# Lorenz63.jl - A type-stable Lorenz 1963 system simulator

![attractor](figs/lorenz_attractor.png?raw=true "L63 attractor")

Lorenz63.jl simulates the Lorenz 1963 system for any given number system, as long as conversions (to and from Float64) and arithmetics (+,-,*,/) are defined. Output always in Float64.

# Usage

```julia
using Lorenz63
XYZ = L63()
```
simulates the Lorenz system with Float64 and standard parameters. Change those by specifying optional arguments

```julia
XYZ = L63(T=Float32,N=100_000,xyz=[1.0,0.0,0.0],σ=10.0,ρ=28.0,β=8/3,s=1.0,Δt=0.005,scheme="RK4")
```
with `T` being the number type ("DataType"), `N` the number of time steps, `xyz` the initial conditions, `σ,ρ,β` the conventional parameters of L63, `s` a scaling factor of the equations (that will be undone for storage), `Δt` the time step, and `scheme` the time integration scheme.
