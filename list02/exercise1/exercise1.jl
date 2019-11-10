# Piotr Popis
"""
Given vectors.
"""
x=[2.718281828, (-3.141592654), 1.414213562,0.577215664,0.301029995]
y=[1486.2497,878366.9879, (-22.37492),4773714.647,0.000185049]

"""
Function that takes given vectors x
and y floating type point and n as
a limit that it should summs to
"""
function alghoritm_ahead(FTP,n,x,y)
        S=FTP(0.0)
    for i in 1:n
        S+=FTP(FTP(x[i])*FTP(y[i]))
    end
    return FTP(S)
end

#compute results for a)
println("a)")
println(alghoritm_ahead(Float64,5,x,y))
println(alghoritm_ahead(Float32,5,x,y))


"""
"""
function alghoritm_backward(FTP,n,x,y)
    S=FTP(0.0)
    for i = n: -1 : 1;
        S+=FTP(x[i])*FTP(y[i])
    end
    return S
end

#compute results for b)
println("b)")
println(alghoritm_backward(Float64,5,x,y))
println(alghoritm_backward(Float32,5,x,y))


"""
"""
function alghoritm_max_to_min(FTP,n,x,y)
    s1= []
    s2= []
    S=0.0


    for i in 1:n
        if (FTP(x[i])*FTP(y[i]))>0
        push!(s1,FTP(x[i])*FTP(y[i]))
    elseif (FTP(x[i])*FTP(y[i]))<0
            push!(s2,FTP(x[i])*FTP(y[i]))
    end
    end
    s1=sort(s1,rev=true)
    s2=sort(s2)
    S=sum(s1)+sum(s2)
    return S
end
println("c)")

println(alghoritm_max_to_min(Float64,5,x,y))
println(alghoritm_max_to_min(Float32,5,x,y))

"""
"""
function alghoritm_max_to_min(FTP,n,x,y)
    s1= []
    s2= []
    S=0.0


    for i in 1:n
        if (FTP(x[i])*FTP(y[i]))>0
        push!(s1,FTP(x[i])*FTP(y[i]))
    elseif (FTP(x[i])*FTP(y[i]))<0
            push!(s2,FTP(x[i])*FTP(y[i]))
    end
    end
    s1=sort(s1)
    s2=sort(s2,rev=true)
    S=sum(s1)+sum(s2)
    return S
end
println("d)")

println(alghoritm_max_to_min(Float64,5,x,y))
println(alghoritm_max_to_min(Float32,5,x,y))
