#Piotr Popis
#245162
module blocksys
using SparseArrays
"""
Function loads Vector b from file file to program's memory.
When loop face end of data program return current data.
Loads the data line by line and returning new b vector.
"""
function getVec(file::String)

    b=zeros(0)

    open(file) do f
    line=(readline(f))
    n=parse(Float64,line)

    while !eof(f)
        line=readline(f)
        n=parse(Float64,line)
        append!(b,n)
    end

    end
    return b
end

"""
Function loads matrix A from file file to program's memory.
Loads first line as 2 parameteres n, l from exercise content, and moving
to saving 3 values by line index i1, index j1 and value not equal to 0 a[i1,j1] of matrix A.
Function return n,l,A when faces end of the file.
"""
function getMatrix(file::String)

    open(file) do f
        line=split(readline(f))
        n=parse(Int64,line[1])
        l=parse(Int64,line[2])
        A=spzeros(Float64,(n),(n))
        while !eof(f)
            line=split(readline(f))
            i=parse(Int64,line[1])
            j=parse(Int64,line[2])
            a=parse(Float64,line[3])
            A[i,j]=a
        end
        return n,l,A
    end
end


println(getVec("b.txt"))
println(getMatrix("A.txt"))

"""
Function that saves Vector x in file x.txt.
It's need the length on the file, meaining count of lines.
At first line prints realtive error rerr.
"""
function save(file::String,x::Vector{Float64},n::Int64)
    open(file,"x.txt") do f
            rerr=norm(ones(n)-x)/norm(x)
            println(f,rerr)
        for i in 1:n
            println(f,x[i])
        end
        end    end



end
