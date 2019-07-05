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
XYZ = L63(T=Float32,N=100_000,xyz=[1.0,0.0,0.0],
```
with `xyz` being the initial conditions, `N` the number of time steps, `
