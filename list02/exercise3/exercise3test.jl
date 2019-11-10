using LinearAlgebra
include("exercise3.jl")
"""
funciton calculate realtive error for result and x.
"""
function realtive_error_calculator(result, x)
    return norm(result - x) / norm(x)
end
"""
function print anand calculate gaus and inversion method for all x.
"""
function compute_Results(precision,A,matrixSize);
    x = ones(precision,matrixSize)
    b = A*x
    gauss = A\b
    inversion = inv(A)*b
    gaussE = realtive_error_calculator(gauss,x)
    inversionE = realtive_error_calculator(inversion,x)

    println(" : ",rank(A), " : ",gaussE," : ",inversionE)
end

function test(precision)
println("-------------------------------------------------------")
println("Hilbert matrix: ")
println("cond : size : MRank : GausError    :     InversionError    ")
for i = 2 : 20
    A=hilb(i)
    print(cond(A)," : ",i)
    compute_Results(precision,A,i)
end
println("-------------------------------------------------------")
println("Random matrix: ")
println("cond : size : MRank : GausError    :     InversionError    ")
for n in [5, 10, 20]
        for c in [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
            print(c," : ",n)
        compute_Results(precision,matcond(n,c),n)
    end
end
println("-------------------------------------------------------")
end

test(Float64)
