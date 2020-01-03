include("/home/piotr/Documents/scientific-computing/list05/blocksys.jl")
include("/home/piotr/Documents/scientific-computing/list05/matrixgen.jl")

using Test
using LinearAlgebra
using Plots

plotly()


function countError(n::Int, vector::Vector{Float64})

    err = 0
    for i = 1 : n
        err += abs(1.0 - vector[i])
    end
    err = abs(err / Float64(n))
    print("ERROR: ", err)

end

function test()
    memory = 0
    a = 0
    i = 4
    while i < 50000
        j = 0
        time = 0
        while j < 50
            matrixgen.blockmat(i, 4, 1.0, "/home/piotr/Documents/scientific-computing/list05/A.txt")
            (A, n, l) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/A.txt")
            b = blocksys.computeRSV(A, n, l)
            a = @timed blocksys.solveLU(A, n, l, b)
            time += a[2]
            j += 1
        end
        println(i, ";", time/50, ";", a[3])
        i += 160;
    end
end

print("-----------------16-----------------------------------------------------------------------------------\n")
matrixFile1 = "/home/piotr/Documents/scientific-computing/list05/Data/Data16_1_1/A.txt"
vectorFile1 = "/home/piotr/Documents/scientific-computing/list05/Data/Data16_1_1/b.txt"
n = blocksys.getMatrix(matrixFile1)[1]
l = blocksys.getMatrix(matrixFile1)[2]
matrix =  blocksys.getMatrix(matrixFile1)[3]
matrix_copy =  blocksys.getMatrix(matrixFile1)[3]
vec =  blocksys.getVec(vectorFile1)
println(matrix)
println(vec)



decomposeMatrix(n,l,A)
solveLU(n,l,A,b)

blocksys.computeRSV(n,l,matrix)
xGE1 = @time  blocksys.gaussianElimination(n,l,matrix,vec)
xGEC1 = @time  blocksys.gaussianEliminationWithPivot(n,l,matrix,vec)
xLU1 = @time  blocksys.solveLU(n,l,matrix,vec)
#xLUC1 = @time  blocksys.solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
x1 =  @time matrix \ vec
countError(n,xGE1)
countError(n,xGEC1)

println("-----------------50000-----------------------------------------------------------------------------------\n")
(n, l, A) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data50000_1_1/A.txt")
b = blocksys.getVec("/home/piotr/Documents/scientific-computing/list05/Data/Data50000_1_1/b.txt")
p = blocksys.decompositeMatrixWithPivot(n, l, A)
c = blocksys.solveLUWithPivot(n, l, A, b, p)
println(c)



println("-----------------all-----------------------------------------------------------------------------------\n")

block_size = 4
sizes = [16, 10000, 50000]
gen_sizes = [60, 300, 1000, 5000, 25000]
function compare_error()
    for size in sizes
        # Tests on given matrices
        n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/A.txt")
        b = blocksys.computeRSV(n, l, A)
        x = ones(Float64, n)
        Ap, bp = deepcopy(A), deepcopy(b)

        result = @timed \(A, b)

        gauss = @timed blocksys.gaussianElimination(n, l, Ap, bp)
        pivoted = @timed blocksys.gaussianEliminationWithPivot(n, l, Ap, bp)

        println("//$n & $(norm(x - result[1]) / norm(result[1])) & $(norm(x - gauss[1]) / norm(gauss[1])) & $(norm(x - pivoted[1]) / norm(pivoted[1])) \\\\")
    end
end

compare_error()
