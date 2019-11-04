#Piotr Popis
"""
Function that generate Hilber Matrix.
"""
function hilb(n::Int)
    if(n<1)
        error("N have to be bigger than or equal to 1")
    end
    return [1*(i+j-1)^(-1) for i in 1:n, j in 1:n]
end

"""
Function generates Random matrix.
"""
function matcond(n::Int,c::Float64)
    if(n<2)
        error("N have to be bigger than 1")
        if(c<1.0)
            error("Condition number need to be bigger than or eagual to 1")
        end
    end
    (U,S,V)=svd(rand(n,n))
    return U*diagm(range(1.0,stop=c,length=n))*V'
end
