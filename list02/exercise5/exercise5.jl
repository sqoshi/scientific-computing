#Piotr Popis
"""
calculate population growth.
"""
function population_growth(r,p,precision)
    p=precision(p)
    r=precision(r)
    for i in 1:40
        p=p+r*p*(1-p)
        print(p)
    end
end
"""
calculate population growth with trunc.
"""
function population_growth_round(r,p,precision)
    p=precision(p)
    r=precision(r)
    for i in 1:40
        p=p+r*p*(1-p)
        if(i==10)
            p=trunc(p,digits=3)
        end
        print(p)
    end
end
"""
prints results in a columns
"""
function first_point_test(r,p,precision1,precision2)
    p1=precision1(p)
    p2=precision1(p)
    p3=precision2(p)
    r1=precision1(r)
    r2=precision2(r)
    println("nr : Float32 : Float32 trunc : Float64")
    for i in 1:40
        p1=p1+r1*p1*(1-p1)
        p2=p2+r1*p2*(1-p2)
        p3=p3+r2*p3*(1-p3)
        if(i==10)
            p2=trunc(p2,digits=3)
        end
        println(i," : ",p1," : ",p2," : ",p3)
    end
end
println("------------------------------------------")
first_point_test((3.0),(0.01),Float32,Float64)
println("------------------------------------------")
