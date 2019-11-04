using LinearAlgebra
include("exercise3.jl")
precision = Float64

#function using Gaussian elimination Method to solve the matrix
function gaussianElimination(A,b);
    return A\b
end

#function using inversion to solve the matrix
function inversionMethod(A,b);
    return inv(A)*b
end

#function counting the error
function errorCount(result, x)
    return norm(result - x) / norm(x)
end

#function which counts and prints the results
function getResult(precision,A,matrixSize);
    #creates identity matrix x
    x = ones(precision,matrixSize)
    b = A*x
    gaussResults = gaussianElimination(A,b)
    inversionResults = inversionMethod(A,b)
    gaussError = errorCount(gaussResults,x)
    inversionError = errorCount(inversionResults,x)

    #println(matrixSize,"x",matrixSize," & ", rank(A)," & ", cond(A), " & ", gaussError," & ", inversionError, "\\\\")
    #@printf("%dx%d & %d & %.12e & %.12e & %.12e \\\\\n",matrixSize,matrixSize,rank(A),cond(A),gaussError,inversionError)

    println("MatrixSize: ",matrixSize, " gaussError: ", gaussError," inversionError: ",inversionError)
end

#ruuning for Hilbert matrix
println("Hilbert matrix: ")
for i = 1 : 20
    getResult(precision,hilb(i),i)
end


n = [Int(5),Int(10),Int(20)]
c = [1,10,10^(3),10^(7),10^(12),10^(16)]
#running for random matrix
println("Random matrix: ")
for i = 1 : 3
    for j = 1 : length(c)
        getResult(precision,matcond(Int(n[i]),Float64(c[j])),n[i])
    end
end
