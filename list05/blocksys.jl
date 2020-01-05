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
	open(file) do f
			n = parse(Int64, readline(f))
			b = Array{Float64}(undef,n)
			iter = 1
			while !eof(f)
				b[iter] = parse(Float64, readline(f))
				iter += 1
			end
			b
		end
end

"""
Function loads matrix A from file file to program's memory.
Loads first line as 2 parameteres n, l from exercise content, and moving
to saving 3 values by line index i1, index j1 and value not equal to 0 a[i1,j1] of matrix A.
Function return n,l,A when faces end of the file.
"""
function getMatrix(file::String)
	open(file) do f
		line = split(readline(f))
		n = parse(Int64, line[1])
		l = parse(Int64, line[2])
		v = convert(Int64, n / l)
		elements = v * l * l + (v - 1) * 2 * l + (v - 1) * l
		I = Array{Int64}(undef,elements)
		J = Array{Int64}(undef,elements)
		V = Array{Float64}(undef,elements)
		iter = 1
		while !eof(f)
			line = split(readline(f))
			I[iter] = parse(Int64, line[2])
			J[iter] = parse(Int64, line[1])
			V[iter] = parse(Float64, line[3])
			iter += 1
		end
		(n,l,sparse(I, J, V))
	end
end
function load_matrix(file :: String)
	open(file) do f
		line = split(readline(f))

		# Read the size of matrix A
		n = parse(Int64, line[1])

		# Read the size of matrix Ak, Bk, Ck
		l = parse(Int64, line[2])

		# Declare empty sparse matrix of size n by n
		A = spzeros(Float64, n, n)

		while !eof(f)
			line = split(readline(f))

			# Read the indexes from file
			i = parse(Int64, line[1])
			j = parse(Int64, line[2])

			# Read the value for given indexes
			value = parse(Float64, line[3])
			A[i, j] = value
		end
		return n,l,A
	end
end

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
function computeRSV(n::Int64,l::Int64,A::SparseMatrixCSC{Float64,Int64})
	b = zeros(Float64, n)
	v = convert(Int64, n/l)
	for i in 1:v
		min_idx = convert(Int64, max(l-2 + (i-2)*l, 1))
		max_idx = i * l
		for j in 1:l
			row = (i-1)*l + j
			for k in min_idx:max_idx
				b[row] += A[k, row]
			end
			b[row] +=  i < v ? A[row+l, row] : 0
		end
	end
	b
end

"""
Function that uses gaussian eliminato and subsitute alghoritm

"""
function gaussianElimination(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64})
    #gaussianElimination
    for i in 1 : n-1
        lastNonZeroInColumn = convert(Int64, min(l + l * floor((i+1) / l), n))
        lastNonZeroInRow = convert(Int64,min(i+l,n))

        for j  in i+1 : lastNonZeroInColumn
			if abs(A[i,i]) < eps(Float64)
				error(" Cannot perform standard gaussian elimination.
				Use gaussian elimination with pivot instead.")
			end
			z = A[i,j]/A[i,i]
            A[i,j] = 0

            for k in i+1:lastNonZeroInRow
            	A[k,j] -=z*A[k,i]
            end
			b[j] -= z*b[i]

        end
    end
	    x = Array{Float64}(undef,n)
    #Substitute
    for i in n:-1:1
        sum = 0.0
        lastNonZeroInRow = convert(Int64,min(i+l,n))
        for j in i+1 : lastNonZeroInRow
            sum +=A[j,i]*x[j]
        end
        x[i]=(b[i]-sum)/A[i,i]
    end
     x
end




function gaussianEliminationWithPivot(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64})
	p = collect(1:n)

		for k in 1:n - 1
			max_row = convert(Int64, min(l + l * floor((k+1) / l), n))
			max_col = convert(Int64, min(2*l + l*floor((k+1)/l), n))

			for i in k + 1:max_row
				row_idx = k
				max = abs(A[k,p[k]])
				for x in i:max_row
					if (abs(A[k,p[x]]) > max)
						row_idx = x;
						max = abs(A[k,p[x]])
					end
				end
				if (abs(max) < eps(Float64))
					error("All elements in column ", k, " are zeros")
				end
				p[k], p[row_idx] = p[row_idx], p[k]
				z = A[k,p[i]] / A[k,p[k]]
				A[k,p[i]] = 0

				for j in k + 1:max_col
					A[j,p[i]] = A[j,p[i]] - z * A[j,p[k]]
				end
				b[p[i]] = b[p[i]] - z * b[p[k]]
			end
		end

		x = Array{Float64}(undef,n)

		for i in n:-1:1
			suma = 0.0
			limit = convert(Int64, min(2*l + l*floor((i+1)/l), n))
			for j in i + 1:limit
				suma += A[j,p[i]] * x[j]
			end
			x[i] = (b[p[i]] - suma) / A[i, p[i]]
		end
		x
	end



"""
Function decompse given matrix A as
2 ingridients L and U.
I am using gauss elimination alghoritm
with exception that we save z in A[i,j].
"""
function decomposeMatrix(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64})
    #gaussianElimination
    for i = 1 : n-1
        lastNonZeroInColumn = convert(Int64, min(l + l * floor((i+1) / l), n))
        lastNonZeroInRow = convert(Int64,min(i+l,n))

        for j  in i+1 : lastNonZeroInColumn
			if (abs(A[i,i]) < eps(Float64)) #from exercises prof. Zieliński
				error("ELement that belong to some matrix diagonal is equal to 0")
				exit(1)
			end

			z = A[i,j]/A[i,i]
            A[i,j] = z # difference in code

            for k in i+1:lastNonZeroInRow
            	A[k,j] -= z*A[k,i]
            end

        end
    end
end

"""
Function decompose Matrix A to
matrix L and U with choosen
main element named pivot.
"""
function decompositeMatrixWithPivot(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64})
	#permutation array
	p = collect(1:n)
	for i in 1:n-1
	    lastNonZeroInColumn = convert(Int64, min(l + l * floor((i+1) / l), n))
	    lastNonZeroInRow = convert(Int64, min(2l + l * floor((i+1) / l), n))

	    for j  in i+1 : lastNonZeroInColumn
	        rowIndex = i
	        max = abs(A[i,p[i]])

	        for k in j:lastNonZeroInColumn
	            if (abs(A[i,p[k]]) > max)
	                rowIndex = k
	                max = abs(A[i,p[k]])
	            end
	        end

	        if (abs(max) < eps(Float64))
					error("Column \"", i, "\" has 0 as max, matrix is osobliwa")
			end
			p[i], p[rowIndex] = p[rowIndex], p[i]

			z = A[i,p[j]]/A[i,p[i]]
	        A[i,p[j]] = z
			for k in i+1:lastNonZeroInRow
	        	A[k,p[j]]-=z*A[k,p[i]]
	        end
		end
	end
			return p
end

function LU_decomposition_with_pivot( n::Int64, l::Int64,A::SparseMatrixCSC{Float64, Int64})
	p = collect(1:n)

	for k in 1:n - 1
		max_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		max_col = convert(Int64, min(2 * l + l * floor((k+1) / l), n))
		for i in k + 1 : max_row
			max_idx = k
			max = abs(A[k,p[k]])
			for x in i : max_row
				if (abs(A[k,p[x]]) > max)
					max_idx = x;
					max = abs(A[k,p[x]])
				end
			end
			if (abs(max) < eps(Float64))
				error("Matrix is singular. Cannot perform LU decomposition.")
			end
			p[k], p[max_idx] = p[max_idx], p[k]
			z = A[k,p[i]] / A[k,p[k]]
			A[k,p[i]] = z
			for j in k+1:max_col
				A[j,p[i]] = A[j,p[i]] - z * A[j,p[k]]
			end
		end
	end
	return p
end


function solveLU(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64})
    x = Array{Float64}(undef,n)
	z = Array{Float64}(undef,n)

	#Substitute back
    for i in 1:n
        sum = 0.0
        firstNonZeroInRow = convert(Int64,max(l * floor((i - 1) / l) - 1, 1))
        for j in firstNonZeroInRow:i-1
            sum += A[j,i]*z[j]
        end
        z[i]=b[i]-sum
    end

    #Substitute forward
    for i in n:-1:1
        sum = 0.0
        lastNonZeroInRow = convert(Int64,min(i+l,n))
        for j in i+1 : lastNonZeroInRow
            sum += A[j,i]* x[j]
        end
        x[i]=(z[i]-sum)/A[i,i]
    end
    return x
end

function solveLUWithPivot(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64},p::Vector{Int64})
	x = Array{Float64}(undef,n)
	z = Array{Float64}(undef,n)

	#Substitute back
    for i in 1:n
        sum = 0.0
        firstNonZeroInRow =  convert(Int64, max(l * floor((i-1) / l) - 1, 1))
        for j in firstNonZeroInRow : i-1
            sum += A[j,p[i]]*z[j]
        end
        z[i]=b[p[i]]-sum
    end

    #Substitute forward
    for i in n:-1:1
        sum = 0.0
        lastNonZeroInRow = convert(Int64, min(2*l + l*floor((i+1)/l), n))
        for j in i+1 : lastNonZeroInRow
            sum += A[j,p[i]]*x[j]
        end
        x[i]=(z[i]-sum)/A[i,p[i]]
    end
     x
end

function LU(n::Int64, l::Int64, A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64})
		decomposeMatrix(n,l,A)
		solveLU(n,l,A,b)
end

function LUpivot(n::Int64, l::Int64, A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64})
	p = decompositeMatrixWithPivot(n,l,A)
	solveLUWithPivot(n,l,A,b,p)
end


end
