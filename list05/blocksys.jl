#Piotr Popis
#245162
module blocksys
using SparseArrays
export getVec,getMatrix,save,calculateVecb,gaussianElimination
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
            rerr = norm(ones(n)-x)/norm(x)
            println(f,rerr)
        for i in 1:n
            println(f,x[i])
        end
        end
    end

"""
Function calculates b vector using formula b=A*x.
Based on Sparse Array A, length of the vector n, and
l should be bigger than or equal to 2 and it's
size of the block Ak,Bk,Ck
"""
function calculateVecb(n::Int64,l::Int64,A::SparseMatrixCSC{Float64,Int64})
    if (l<2){ return}end
    b=zeros(Float64,n)
    x=ones(Float64,n)
    v=Int64(n/l)
    for i in 1:n
        lastNotZeroInCurrentRow = Integer(min(i+l,n))
        for j in 1: lastNotZeroInCurrentRow
            b[i]+=A[i,j]*x[j] #x[j] is useless cause anyway its (1,...,1)^T
        end

    end
    return b
end

function gaussianElimination(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64},saveToFile::Bool)
    x = Vector{Float64}(undef,n)
    for i = 1 : n-1
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l,n))
        lastNonZeroInRow = Integer(min(i+l,n))
        for j  in i+1 : lastNonZeroInColumn
            lij= A[i,j]/A[i,i]
            A[i,j]=0
            for k in i+1:lastNonZeroInRow
            A[k,j]-=lij*A[k,i]
            end
            b[j]-=lij*b[i]
        end
    end
    for i in n:-1:1
        sum=0.0
        maxC=min(n,i+l)
        for j in i+1:maxC
            sum+=A[j,i]*x[j]
        end
        x[i]=(b[i]-sum)/A[i,i]
    end
    return x
end
vectorFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/b.txt"
matrixFile2 = "/home/piotr/Documents/scientific-computing/list05/Data/Data10000_1_1/A.txt"
#function gaussianElimination(n::Int64,l::Int64,A::SparseMatrixCSC{Float64,Int64},b::Vector{Float64},LU::Bool)
print("-----------------10000\n")
n = getMatrix(matrixFile2)[1]
l = getMatrix(matrixFile2)[2]
matrix = getMatrix(matrixFile2)[3]
vec = getVec(vectorFile2)#save(file::String,x::Vector{Float64},n::Int64)
println(gaussianElimination(n,l,matrix,vec,false))
end
