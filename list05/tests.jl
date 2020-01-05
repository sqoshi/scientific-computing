#Piotr Popis
#245162
include("/home/piotr/Documents/scientific-computing/list05/blocksys.jl")
include("/home/piotr/Documents/scientific-computing/list05/matrixgen.jl")

using SparseArrays
using Test
using LinearAlgebra
using Plots

gr()


function countError(n::Int, vector::Vector{Float64})

    err = 0
    for i = 1 : n
        err += abs(1.0 - vector[i])
    end
    err = abs(err / Float64(n))
    print("ERROR: ", err)

end





function test()
    rozmiar = 25
    repeat = 10
    x=Array{Float64}(undef,rozmiar)
    y=Array{Float64}(undef,rozmiar)
    y1=Array{Float64}(undef,rozmiar)
    m=Array{Float64}(undef,rozmiar)
    m1=Array{Float64}(undef,rozmiar)

    mem = 0
    mem1 = 0
    a = 0
    a1 = 0

    i = 4
    it=1
    while it <= rozmiar
        j = 0
        time = 0.0
        time1 = 0.0
        while j < repeat
            matrixgen.blockmat(i, 4, 1.0, "/home/piotr/Documents/scientific-computing/list05/A.txt")
            (n, l, A) = blocksys.load_matrix("/home/piotr/Documents/scientific-computing/list05/A.txt")
            A1 = deepcopy(A)
            A2 = deepcopy(A)
            b = blocksys.computeRSV(n, l, A)
            b1 = deepcopy(b)
            b2 = deepcopy(b)
            a = @timed blocksys.gaussianElimination(n, l, A1,b1)
            a1 = @timed blocksys.LU(n,l,A2,b2)
            time += a[2]
            time1 += a1[2]
            mem += a[3]
            mem1 += a1[3]
            j += 1
        end
        println(i, ";", time/repeat, ";", a[3])
        x[it] = i
        y[it] = time/repeat
        y1[it] = time1/repeat
        m[it] = mem/repeat
        m1[it] = mem1/repeat
        it+=1
            i+=1196

    end
    plot(x, y, color="red",seriestype=:scatter, linewidth=1.0, label="gauss")
    plot!(x, y1, color="blue",seriestype=:scatter, linewidth=1.0, label="lu")
    png("/home/piotr/Documents/scientific-computing/list05/plots/GAUSSxLU_time_size.png")

    plot(x, m, color="red",seriestype=:scatter, linewidth=1.0, label="gauss")
    plot!(x, m1, color="blue",seriestype=:scatter, linewidth=1.0, label="lu")
    png("/home/piotr/Documents/scientific-computing/list05/plots/GAUSSxLU_memory_size.png")
end
test()
function t()
    a = 0
    (n, l, A) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data10000/A.txt")
    A1 = deepcopy(A)

    b = blocksys.computeRSV(n, l, A)
    b1 = deepcopy(b)

    a = @timed blocksys.LUpivot(n, l, A1,b1)
    return a
end

println(t()[1])
println("-----------------all-----------------------------------------------------------------------------------\n")
println("n;time;memory")



block_size = 4
sizes1 = [16, 10000]
gen_sizes = [1000, 5000, 25000]
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



function compare_gaussian_exist(sizes::Array{Int64})
    println("----------------------------------------------------------------------------------------------------------------------------")
   for size in sizes
       # Tests on given matrices
       n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/A.txt")
       b = blocksys.getVec("/home/piotr/Documents/scientific-computing/list05/Data/Data$size/b.txt")
       Ap, bp = deepcopy(A), deepcopy(b)
       Ad,bd = deepcopy(A), deepcopy(b)
       Al, bl = deepcopy(A), deepcopy(b)
       Alu, blu = deepcopy(A), deepcopy(b)

       result = @timed \(A, b)
       lu = @timed blocksys.LU(n,l,Al,bl)
        pivlu = @timed blocksys.LUpivot(n,l,Alu,blu)
       gauss = @timed blocksys.gaussianElimination( n, l,Ad, bd)
       pivoted = @timed blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)

       println("Size: $size | (t) Gauss $(gauss[2]) s | (mem) Gauss: $(gauss[3]/2^20) MB | (t) pivoted: $(pivoted[2]) s | (mem) pivoted: $(pivoted[3]/2^20) MB")
       println("Size: $size | (t) LU: $(lu[2]) s | (mem) LU: $(lu[3]/2^20) MB | (t) pivoted: $(pivlu[2]) s | (mem) pivoted: $(pivlu[3]/2^20) MB")

      println("$size & time $((result[2], 6)) &mem: res: $((result[3]/2^20, 4)) \\\\")
   end
end

compare_gaussian_exist(sizes1)



function compare_gaussian_generated(sizes::Array{Int64})
   for size in sizes
       n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/generated/$(size)/A.txt")
       b = blocksys.computeRSV(size, block_size,A)
       Ap, bp = deepcopy(A), deepcopy(b)
       Ad,bd = deepcopy(A), deepcopy(b)
       Al, bl = deepcopy(A), deepcopy(b)
       Alu, blu = deepcopy(A), deepcopy(b)


       lu = @timed blocksys.LU(n,l,Al,bl)
       pivlu = @timed blocksys.LUpivot(n,l,Alu,blu)
       gauss = @timed blocksys.gaussianElimination( n, l,Ad, bd)
       pivoted = @timed blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)
       result = @timed \(A, b)
       println("Size: $size | (t) Gauss $(gauss[2]) s | (mem) Gauss: $(gauss[3]/2^20) MB | (t) pivoted: $(pivoted[2]) s | (mem) pivoted: $(pivoted[3]/2^20) MB")
       println("Size: $size | (t) LU: $(lu[2]) s | (mem) LU: $(lu[3]/2^20) MB | (t) pivoted: $(pivlu[2]) s | (mem) pivoted: $(pivlu[3]/2^20) MB")
       println("$size & time $((result[2], 6)) &mem: res: $((result[3]/2^20, 4)) \\\\")

   end
end

compare_gaussian_generated(gen_sizes)
