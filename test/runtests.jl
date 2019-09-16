using Lorenz63
using Test

@testset "Equilibrium" begin
    XYZ = L63(xyz=[0.,0.,0.])
    @test all(XYZ[:,end] == [0.,0.,0.,])
end

@testset "Bounded" begin
    XYZ = L63()
    @test all(abs.(XYZ) .< 100.0)
end

@testset "Type-flexbile" begin
    XYZ32 = L63(Float32)
    XYZ16 = L63(Float16)

    @test XYZ32[:,1] == XYZ16[:,1]
    @test XYZ32[:,2] != XYZ16[:,2]
end
