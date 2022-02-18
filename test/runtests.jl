using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    f(x) = 5x^2 - 16x + 3
    f′(x) = 10x - 16
    g(x) = x^2 + 2
    g′(x) = 2x
    @test abs(newtonroot(f, f′, x₀=4) - 3) < 1e-7
    @test abs(newtonroot(f, f′, x₀=0) - 0.2) < 1e-7
    @test abs(newtonroot(f, x₀=4) - 3) < 1e-7
    @test abs(newtonroot(f, x₀=0) - 0.2) < 1e-7
    @test abs(newtonroot(f, f′, x₀=BigFloat(0.3)) - 0.2) < 1e-7
    @test abs(newtonroot(f, x₀=BigFloat(0.3)) - 0.2) < 1e-7
    @test isnan(newtonroot(g, g′, x₀=0))
    @test isnan(newtonroot(f, f′, x₀=4, maxiter=1))
    @test abs(newtonroot(f, f′, x₀=10, tolerance=1E+4) - 3) > 1e-1
end
