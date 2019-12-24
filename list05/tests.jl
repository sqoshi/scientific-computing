include("/home/piotr/Documents/scientific-computing/list05/blocksys.jl")
using Test

vectorFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/b.txt"
matrixFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/A.txt"
#function gaussianElimination(n::Int64,l::Int64,A::SparseMatrixCSC{Float64,Int64},b::Vector{Float64},LU::Bool)
print("-----------------10000\n")
n = getMatrix(matrixFile2)[1]
l = getMatrix(matrixFile2)[2]
vec = getVec(vectorFile2)#save(file::String,x::Vector{Float64},n::Int64)
matrix = getMatrix(matrixFile2)[3]
xGE2 = blocksys.gaussianElimination(10000,4,matrix,vec,false)
x2 = @time matrix \ vec

@testset "t1" begin
    @test
end
