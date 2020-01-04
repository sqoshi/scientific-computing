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
    x=Array{Float64}(undef,20)
    y=Array{Float64}(undef,20)

    memory = 0
    a = 0
    i = 4
    it=1
    while i < 2000
        j = 0
        time = 0.0
        while j < 50
            matrixgen.blockmat(i, 4, 1.0, "/home/piotr/Documents/scientific-computing/list05/A.txt")
            (A, n, l) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/A.txt")
            b = blocksys.computeRSV(A, n, l)
            a = @timed blocksys.LU(A, n, l, b)
            time += a[2]
            j += 1
        end
        println(i, ";", time/50, ";", a[3])
        x[it] = i
        y[it] = time
        it+=1
        i += 100
    end
    plot(x, y, color="red",seriestype=:scatter, linewidth=2.0)
end

test()
println("n;time;memory")
println("-----------------all-----------------------------------------------------------------------------------\n")

block_size = 4
sizes1 = [16, 10000]
gen_sizes = [60, 300, 1000, 5000, 25000]
function compare_error(sizes::Array{Int64})
    for size in sizes
        # Tests on given matrices
        #n,l,A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/A.txt")
        n,l,A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/generated/$size/A.txt")
        b = blocksys.computeRSV(n, l, A)
        x = ones(Float64, n)
        Ap, bp = deepcopy(A), deepcopy(b)
        Ad, bd = deepcopy(A), deepcopy(b)
        result = @timed \(A, b)
        Alu, blu = deepcopy(A), deepcopy(b)
        Alup, blup = deepcopy(A), deepcopy(b)

        gauss = @timed blocksys.gaussianElimination(n, l, Ad, bd)
        pivoted = @timed blocksys.gaussianEliminationWithPivot(n, l, Ap, bp)

        LU = @timed blocksys.LU(n,l,Alu,blu)
        LUp = @timed blocksys.LUpivot(n,l,Alup,blup)


        println("----------------------------------------------------------------------------------------------------\n")
        println("-----------------------------------------Gauss-----------------------------------------------------------\n")
        println("//$n & $(norm(x - gauss[1]) / norm(gauss[1])) & $(norm(x - pivoted[1]) / norm(pivoted[1])) \\\\")
        println("-----------------------------------------LU-----------------------------------------------------------\n")
        println("//$n & $(norm(x - LU[1]) / norm(LU[1])) & $(norm(x - LUp[1]) / norm(LUp[1])) \\\\")
        println("----------------------------------------------------------------------------------------------------\n")
    end
end

compare_error(gen_sizes)



























function compare_gaussian_exist()
    println("----------------------------------------------------------------------------------------------------------------------------")
   for size in sizes
       # Tests on given matrices
       n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/A.txt")
       b = getVec("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/b.txt")
       Ap, bp = deepcopy(A), deepcopy(b)
       Al, bl = deepcopy(A), deepcopy(b)
       Alu, blu = deepcopy(A), deepcopy(b)

       result = @timed \(A, b)

       gauss = @timed blocksys.gaussianElimination( n, l,A, b)
       pivoted = @timed blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)

       println("Size: $size | (t) Gauss $(gauss[2]) s | (mem) Gauss: $(gauss[3]/2^20) MB | (t) pivoted: $(pivoted[2]) s | (mem) pivoted: $(pivoted[3]/2^20) MB")
      # println("Size: $size | (t) Gauss $(lu[2]) s | (mem) Gauss: $(lu[3]/2^20) MB | (t) pivoted: $(pivlu[2]) s | (mem) pivoted: $(pivlu[3]/2^20) MB")

       println("$size & $((result[2], 6)) & $((result[3]/2^20, 4)) & $((gauss[2], 6)) & $((gauss[3]/2^20, 4)) & $((pivoted[2], 6)) & $((pivoted[3]/2^20, 4)) \\\\")
   end
end







function compare_gaussian_generated()
   for size in gen_sizes
       n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/generated/$(size)/A.txt")
       b = blocksys.computeRSV(size, block_size,A)
       Ap, bp = deepcopy(A), deepcopy(b)

       result = @timed \(A, b)

       gauss = @timed blocksys.gaussianElimination(n, l,A,b)
       pivoted = @timed blocksys.gaussianEliminationWithPivot( n, l,Ap, bp)

       println("$size & $((result[2], 6)) & $((result[3]/2^20, 4)) & $((gauss[2], 6)) & $((gauss[3]/2^20, 4)) & $((pivoted[2], 6)) & $((pivoted[3]/2^20, 4)) \\\\")
   end
    println("----------------------------------------------------------------------------------------------------------------------------")
end
end
compare_gaussian_exist()
compare_gaussian_generated()
