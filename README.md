[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://travis-ci.com/milankl/Lorenz63.jl.svg?branch=master)](https://travis-ci.com/milankl/Lorenz63.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/fbe7bvd6gs1qp9fy?svg=true)](https://ci.appveyor.com/project/milankl/lorenz63-jl)
[![Build Status](https://api.cirrus-ci.com/github/milankl/Lorenz96.jl.svg)](https://cirrus-ci.com/github/milankl/Lorenz96.jl)

# Lorenz63.jl - A type-flexible Lorenz 1963 system simulator
![attractor](figs/lorenz_attrac.png?raw=true "L63 attractor")

Lorenz63.jl simulates the [Lorenz 1963 system](https://en.wikipedia.org/wiki/Lorenz_system) for any given number type, as long as conversions (to and from Float64) and arithmetics (+,-,*) are defined - the scaled equations are written division-free. Output always in Float64.

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

# Equations

The Lorenz system is scaled with `s` and therefore the prognostic variables are actually  `sx -> x, sy -> y and sz -> z`. The RHS then reads with `s_inv = 1/s`

```
dx = y-x
dy = x*(ρ-z*s_inv) - y
dz = x*(y*s_inv) - β*z

x_i+1 = x_i + RKx*dx
y_i+1 = y_i + RKy*dy
z_i+1 = z_i + RKz*dz
```
`RKx, RKy, RKz` include the Runge Kutta coefficients of the explicit time scheme (Runge Kutta 4th order by default), the time step `Δt` and for `x` also the parameter `σ` and are precomputed to avoid intermediate calculations.


# Installation

In the package manager do

```julia
add https://github.com/milankl/Lorenz63.jl
```
