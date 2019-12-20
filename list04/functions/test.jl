include("/home/piotr/Documents/scientific-computing/list04/functions/functions.jl")
#Piotr Popis
using Test
using LinearAlgebra

x0 = [2.0,3.0,4.0,5.0]
x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]
f0 = [1.0,2.0,-0.5,16.0]
l = [-1.0,0.0,1.0,2.0]
fl = [-1.0,0.0,-1.0,2.0]

fldiff=ilorazyRoznicowe(x0, f0)

fdiif0 = [1.0, 1.0, -1.75, 3.75]
fdiff1 = [1.0, 2.0, -3.0/8.0, 7.0/40.0]
x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f2 = [2.0, 1.0, 2.0, -7.0, 10.0]
fdiff2 = [2.0, -1.0, 1.0, -2.0, 2.0]

@testset "test nr1 iloracyRoznicowe" begin
    @test isapprox(ilorazyRoznicowe(x1, f1), fdiff1)
    @test isapprox(ilorazyRoznicowe(x2, f2), fdiff2)
end

# Excercise 2
fdiff3 = ilorazyRoznicowe(x2, f2)
ilorazyRoznicowe([-1.0, 0.0, 1.0, 2.0], [-1.0, 0.0, -1.0, 2.0])
@testset "Test nr2 warnew" begin
    @test isapprox(warNewton(x2, fdiff3, 2.0), -7.0)
    @test isapprox(warNewton(x2, fdiff3, 10.0), 13961.0)
    @test isapprox(warNewton(x2, fdiff3, 5.0), 506.0)
    @test isapprox(warNewton(x2, fdiff3, -3.0), 298.0)
end

# Excercise 3
out = [3.0, 30.0, -8.0, -27.0, 10.0]
out2 = [0.0, -1.0, -1.0, 1.0]

@testset "Test nr3 naturlna" begin
    @test isapprox(naturalna(x2, f2), out)
    @test isapprox(naturalna([-1.0, 0.0, 1.0, 2.0],ilorazyRoznicowe([-1.0, 0.0, 1.0, 2.0], [-1.0, 0.0, -1.0, 2.0])),[0.0, -1.0, -1.0, 1.0])
end
