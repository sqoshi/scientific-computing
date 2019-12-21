module blocksys
using SparseArrays
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

end
