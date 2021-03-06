function rhs!(dxyz::Array{T,1},x::T,y::T,z::T,ρ::T,β::T,s_inv::T) where {T<:AbstractFloat}
    @inbounds dxyz[1] = y-x
    @inbounds dxyz[2] = x*(ρ-z*s_inv) - y
    @inbounds dxyz[3] = x*(y*s_inv) - β*z
    return dxyz
end
