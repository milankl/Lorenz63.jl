using Lorenz63
using Test
using Statistics

@testset "Equilibrium" begin
    XYZ = L63(xyz=[0.,0.,0.])
    @test all(XYZ[:,end] == [0.,0.,0.,])
end

@testset "Scaling up" begin
    XYZ1 = L63(s=1.0)
    XYZ10 = L63(s=10.0)

    # simulations are actually different
    @test XYZ1[:,end] != XYZ10[:,end]

    # means are approximately same
    @test isapprox(mean(XYZ1[1,:]),mean(XYZ10[1,:]),rtol=1e-6)
    @test isapprox(mean(XYZ1[2,:]),mean(XYZ10[2,:]),rtol=1e-6)
    @test isapprox(mean(XYZ1[3,:]),mean(XYZ10[3,:]),rtol=1e-6)

    # variances are approximately same
    @test isapprox(var(XYZ1[1,:]),var(XYZ10[1,:]),rtol=1e-6)
    @test isapprox(var(XYZ1[2,:]),var(XYZ10[2,:]),rtol=1e-6)
    @test isapprox(var(XYZ1[3,:]),var(XYZ10[3,:]),rtol=1e-6)
end

@testset "Scaling down" begin
    XYZ1 = L63(s=1.0)
    XYZ10 = L63(s=1/10)

    # simulations are actually different
    @test XYZ1[:,end] != XYZ10[:,end]

    # means are approximately same
    @test isapprox(mean(XYZ1[1,:]),mean(XYZ10[1,:]),rtol=1e-6)
    @test isapprox(mean(XYZ1[2,:]),mean(XYZ10[2,:]),rtol=1e-6)
    @test isapprox(mean(XYZ1[3,:]),mean(XYZ10[3,:]),rtol=1e-6)

    # variances are approximately same
    @test isapprox(var(XYZ1[1,:]),var(XYZ10[1,:]),rtol=1e-6)
    @test isapprox(var(XYZ1[2,:]),var(XYZ10[2,:]),rtol=1e-6)
    @test isapprox(var(XYZ1[3,:]),var(XYZ10[3,:]),rtol=1e-6)
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
