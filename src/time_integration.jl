function RK2_midpoint(N::Int,xyz::Array{T,1},ρ::T,β::T,s::T) where T


#    for i = 1:N
end

function RK4(T::Type,N::Int,xyz::Array{Float64,1},σ::Float64,ρ::Float64,β::Float64,s::Float64,Δt::Float64)

    # scale the initial conditions
    xyz = s*xyz
    s_float = s     # keep a Float64 version of s

    # preallocate for storing results - store without scaling
    XYZout = Array{Float64,2}(undef,3,N+1)
    XYZout[:,1] = xyz/s

    # Runge Kutta 4th order coefficients including time step and sigma for x
    RKα = zeros(3,4)
    RKα[2,:] = 1.0/([1/6.,1/3.,1/3.,1/6.]*Δt)
    RKα[3,:] = RKα[2,:]
    RKα[1,:] = RKα[2,:]/σ
    RKαz = RKα[2,:]/β

    RKβ = zeros(3,3)
    RKβ[2,:] = 1.0/([1/2.,1/2.,1.]*Δt)
    RKβ[3,:] = RKβ[2,:]
    RKβ[1,:] = RKβ[2,:]/σ
    RKβz = RKβ[2,:]/β

    # convert everything to the desired number system determined by T
    xyz = T.(xyz)
    ρ,β,s = T.([ρ,β,s])
    RKα = T.(RKα)
    RKβ = T.(RKβ)

    # preallocate memory for intermediate results
    xyz0 = deepcopy(xyz)
    xyz1 = deepcopy(xyz)
    dxyz = zero(xyz)       # tendencies

    for i = 1:N
        xyz1 = deepcopy(xyz)

        for rki = 1:4
            rhs!(dxyz,xyz1[1],xyz1[2],xyz1[3],ρ,β,s)

            if rki < 4
                xyz1 = xyz + dxyz ./ RKβ[:,rki]
            end

            # sum the RK steps on the go
            xyz0 += dxyz ./ RKα[:,rki]
        end

        xyz = deepcopy(xyz0)

        # store as 64bit, undo scaling
        XYZout[:,i+1] = Float64.(xyz)/s_float
    end

    return XYZout
end
