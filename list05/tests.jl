#Piotr Popis
#245162
include("/home/piotr/Documents/scientific-computing/list05/blocksys.jl")
include("/home/piotr/Documents/scientific-computing/list05/matrixgen.jl")

using SparseArrays
using Test
using Plots
using LinearAlgebra

gr()



function test_comparisions()
    rozmiar = 30
    repeat = 10
    x=Array{Float64}(undef,rozmiar)
    ca=Array{Float64}(undef,rozmiar)
    ca1=Array{Float64}(undef,rozmiar)
    ca2=Array{Float64}(undef,rozmiar)
    ca3=Array{Float64}(undef,rozmiar)

    a = 0
    a1 = 0
    a2 = 0
    a3 = 0
    c = 0
    c1 = 0
    c2 = 0
    c3 = 0
    i = 4
    it=1
    while it <= rozmiar
        j = 0

        while j < repeat
            matrixgen.blockmat(i, 4, 1.0, "/home/piotr/Documents/scientific-computing/list05/A.txt")
            (n, l, A) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/A.txt")
            A1 = deepcopy(A)
            A2 = deepcopy(A)
            A3 = deepcopy(A)
            A4 = deepcopy(A)
            b = blocksys.computeRSV(n, l, A)
            b1 = deepcopy(b)
            b2 = deepcopy(b)
            b3 = deepcopy(b)
            b4 = deepcopy(b)
            a =  @timed blocksys.gaussianElimination(n, l, A1,b1)
            a1 =  @timed blocksys.gaussianEliminationWithPivot(n,l,A2,b2)
            a2 =  @timed blocksys.LU(n, l, A3,b3)
            a3 =  @timed blocksys.LUpivot(n,l,A4,b4)
            c += a[3]
            c1 += a1[3]
            c2 += a2[3]
            c3 += a3[3]
            j += 1
            println(c, " ",c1, " ",c2, " ",c3)
        end
        println(i, ": ", c/repeat," : ", c1/repeat," : ", c2/repeat," : ", c3/repeat)

        x[it] = i
        ca[it] = c/repeat/(2^20)
        ca1[it] = c1/repeat/(2^20)
        ca2[it] = c2/repeat/(2^20)
        ca3[it] = c3/repeat/(2^20)
        it+=1
        i+=1196

    end
    plot(x, ca, color="red",seriestype=:scatter, linewidth=1.0, label="gauss")
    plot!(x, ca1, color="blue",seriestype=:scatter, linewidth=1.0, label="gauss Pivot")
    plot!(x, ca2, color="yellow",seriestype=:scatter, linewidth=1.0, label="lu")
    plot!(x, ca3, color="green",seriestype=:scatter, linewidth=1.0, label="lu Pivot")
    png("/home/piotr/Documents/scientific-computing/list05/plots/all_memory_size.png")

end
test_comparisions()



function test()
    rozmiar = 20
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
            (n, l, A) = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/A.txt")
            A1 = deepcopy(A)
            A2 = deepcopy(A)
            b = blocksys.computeRSV(n, l, A)
            b1 = deepcopy(b)
            b2 = deepcopy(b)
            blocksys.gaussianElimination(n, l, A1,b1)
            blocksys.gaussianEliminationWithPivot(n,l,A2,b2)
            sparse(A1)
            sparse(A2)
            a = @timed blocksys.gaussianElimination(n, l, A1,b1)
            a1 = @timed blocksys.gaussianEliminationWithPivot(n,l,A2,b2)
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
    plot!(x, y1, color="blue",seriestype=:scatter, linewidth=1.0, label="Pivot")
    png("/home/piotr/Documents/scientific-computing/list05/plots/gauss2_time_size.png")

    plot(x, m, color="red",seriestype=:scatter, linewidth=1.0, label="gauss")
    plot!(x, m1, color="blue",seriestype=:scatter, linewidth=1.0, label="Pivot")
    png("/home/piotr/Documents/scientific-computing/list05/plots/gauss2_memory_size.png")

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
        blocksys.LU(n,l,Al,bl)
        blocksys.LUpivot(n,l,Alu,blu)
        blocksys.gaussianElimination( n, l,Ad, bd)
        blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)
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

compare_error(sizes1)



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

       blocksys.LU(n,l,Al,bl)
       blocksys.LUpivot(n,l,Alu,blu)
       blocksys.gaussianElimination( n, l,Ad, bd)
       blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)

       result = @timed \(A, b)
       lu = @timed blocksys.LU(n,l,Al,bl)
        pivlu = @timed blocksys.LUpivot(n,l,Alu,blu)
       gauss = @timed blocksys.gaussianElimination( n, l,Ad, bd)
       pivoted = @timed blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)

       println("Size: $size | (t) Gauss $(gauss[2]) s | (mem) Gauss: $(gauss[3]/2^20) MB | (t) pivoted: $(pivoted[2]) s | (mem) pivoted: $(pivoted[3]/2^20) MB")
       println("Size: $size | (t) LU: $(lu[2]) s | (mem) LU: $(lu[3]/2^20) MB | (t) pivoted: $(pivlu[2]) s | (mem) pivoted: $(pivlu[3]/2^20) MB")

      println("$size & time $(result[2]) &mem: res: $(result[3]/2^20) \\\\")
   end
end

compare_gaussian_exist(sizes1)



function compare_gaussian_generated(sizes::Array{Int64})
   for size in sizes
       n, l, A = blocksys.getMatrix("/home/piotr/Documents/scientific-computing/list05/generated/$(size)/A.txt")
       b = blocksys.computeRSV(size, block_size,A)
       Ap, bp = SparseArrays.sparse(deepcopy(A)), deepcopy(b)
       Ad,bd = SparseArrays.sparse(deepcopy(A)), deepcopy(b)
       Al, bl = SparseArrays.sparse(deepcopy(A)), deepcopy(b)
       Alu, blu = SparseArrays.sparse(deepcopy(A)), deepcopy(b)

       blocksys.LU(n,l,Al,bl)
       blocksys.LUpivot(n,l,Alu,blu)
       blocksys.gaussianElimination( n, l,Ad, bd)
       blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)

       lu = @timed blocksys.LU(n,l,Al,bl)
       pivlu = @timed blocksys.LUpivot(n,l,Alu,blu)
       gauss = @timed blocksys.gaussianElimination( n, l,sparse(Ad), bd)
       pivoted = @timed blocksys.gaussianEliminationWithPivot(n,l,Ap, bp)
       result = @timed \(A, b)
       println("Size: $size | (t) Gauss $(gauss[2]) s | (mem) Gauss: $(gauss[3]/2^20) MB | (t) pivoted: $(pivoted[2]) s | (mem) pivoted: $(pivoted[3]/2^20) MB")
       println("Size: $size | (t) LU: $(lu[2]) s | (mem) LU: $(lu[3]/2^20) MB | (t) pivoted: $(pivlu[2]) s | (mem) pivoted: $(pivlu[3]/2^20) MB")
       println("$size & time $((result[2], 6)) &mem: res: $((result[3]/2^20, 4)) \\\\")

   end
end

compare_gaussian_generated(gen_sizes)
