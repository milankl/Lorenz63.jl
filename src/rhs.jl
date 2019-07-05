function rhs!(dxyz::Array{T,1},x::T,y::T,z::T,ρ::T,β::T,s::T) where {T<:AbstractFloat}
    dxyz[1] = y-x
    dxyz[2] = x*(ρ-z/s) - y
    dxyz[3] = x*(y/s) - β*z
    return dxyz
end
