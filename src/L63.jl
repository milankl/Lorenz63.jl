"""

    XYZ = L63(Float32)

Integrates the Lorenz 1963 model in any given DataType. Default parameters

    L63(::Type{T}=Float64;                      # number format
    N::Int=10_000,                              # number of time steps
    xyz::Array{Float64,1}=[5.0,5.0,20.0],       # initial conditions
    σ::Float64=10.0,                            # σ parameter
    ρ::Float64=28.0,                            # ρ parameter
    β::Float64=8/3,                             # β parameter
    s::Float64=1.0,                             # scaling
    Δt::Float64=0.002,                          # time step
    scheme::String="RK4"                        # time integration scheme

# Examples
```jldoc
julia> X1 = L63(Float64,N=100_000);
julia> X2 = L63(Float32,Δt=0.05);
```
"""
function L63(::Type{T}=Float64;
            N::Int=10_000,
            xyz::Array{Float64,1}=[5.0,5.0,20.0],
            σ::Float64=10.0,
            ρ::Float64=28.0,
            β::Float64=8/3,
            s::Float64=1.0,
            Δt::Float64=0.002,
            scheme::String="RK4") where {T<:AbstractFloat}

            if scheme == "RK4"
                return RK4(T,N,xyz,σ,ρ,β,s,Δt)
            else
                throw(error("Other schemes than RK4 not implemented yet."))
            end
end
