function RK4(::Type{T},
            N::Int,
            xyz::Array{Float64,1},
            σ::Float64,
            ρ::Float64,
            β::Float64,
            s::Float64,
            Δt::Float64) where {T<:AbstractFloat}


    # preallocate for storing results - store without scaling
    XYZout = Array{Float64,2}(undef,3,N+1)
    XYZout[:,1] = xyz

    # Runge Kutta 4th order coefficients including time step and sigma for x
    RKα = zeros(3,4)
    RKα[2,:] = [1/6.,1/3.,1/3.,1/6.]*Δt
    RKα[3,:] = RKα[2,:]
    RKα[1,:] = RKα[2,:]*σ

    RKβ = zeros(3,3)
    RKβ[2,:] = [1/2.,1/2.,1.]*Δt
    RKβ[3,:] = RKβ[2,:]
    RKβ[1,:] = RKβ[2,:]*σ

    # convert everything to the desired number system determined by T and scale
    xyz = T.(s*xyz)
    s_inv = T(1.0/s)
    ρ,β = T.([ρ,β])
    RKα = T.(RKα)
    RKβ = T.(RKβ)

    # preallocate memory for intermediate results
    xyz0 = deepcopy(xyz)
    xyz1 = deepcopy(xyz)
    dxyz = zero(xyz)       # tendencies

    for i = 1:N
        @simd for j in 1:3
            @inbounds xyz1[j] = xyz[j]
        end

        for rki = 1:4
            rhs!(dxyz,xyz1[1],xyz1[2],xyz1[3],ρ,β,s_inv)

            if rki < 4
                @simd for j in 1:3
                    @inbounds xyz1[j] = xyz[j] + dxyz[j] * RKβ[j,rki]
                end
            end

            # sum the RK steps on the go
            @simd for j in 1:3
                @inbounds xyz0[j] += dxyz[j] * RKα[j,rki]
            end
        end

        @simd for j in 1:3
            @inbounds xyz[j] = xyz0[j]
        end

        # store as 64bit, undo scaling
        XYZout[:,i+1] = Float64.(xyz)/s
    end

    return XYZout
end
