function L63(;
            T::DataType=Float64,
            N::Int=10_000,
            xyz::Array{Float64,1}=[5.0,5.0,20.0],
            σ::Float64=10.0,
            ρ::Float64=28.0,
            β::Float64=8/3,
            s::Float64=1.0,
            Δt::Float64=0.005,
            scheme::String="RK4")

            if scheme == "RK4"
                return RK4(T,N,xyz,σ,ρ,β,s,Δt)
            else
                throw(error("Other schemes than RK4 not implemented yet."))
            end
end
