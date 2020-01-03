include("/home/piotr/Documents/scientific-computing/list05/blocksys.jl")
using Test
using Plots
plotly()

vectorFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/b.txt"
matrixFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/A.txt"
#function gaussianElimination(n::Int64,l::Int64,A::SparseMatrixCSC{Float64,Int64},b::Vector{Float64},LU::Bool)
print("-----------------10000\n")
n = blocksys.getMatrix(matrixFile2)[1]
l = blocksys.getMatrix(matrixFile2)[2]
b = blocksys.getVec(vectorFile2)#save(file::String,x::Vector{Float64},n::Int64)
A = blocksys.getMatrix(matrixFile2)[3]


x1 = blocksys.getMatrix(matrixFile2)[3] \ blocksys.getVec(vectorFile2);


x2 = blocksys.gaussianElimination(n,l,blocksys.getMatrix(matrixFile2)[3],blocksys.getVec(vectorFile2))
x3 = blocksys.gaussianEliminationWithPivot(n,l,blocksys.getMatrix(matrixFile2)[3],blocksys.getVec(vectorFile2))
t2 = @time blocksys.gaussianElimination(n, l ,A, b)
println(reverse(x1))
println(reverse(x2))
println(reverse(x3))
println(x2)

plot(x1,linecolor="green")
plot!(x2)
savefig("/home/piotr/Documents/scientific-computing/list05/plot.png")

@testset "Gaussian elimination" begin
    @test isapprox(x2,x3)
    @test isapprox(x3,x2)
    @test isapprox(x2,x1)
    @test isapprox(x1,x2)
end
