#Piotr Popis
"""
"""
function population_growth(r,p,precision)
    p=precision(p)
    r=precision(r)
for i in 1:40
    p=p+r*p*(1-p)
end
println(p)
end
"""
"""
function population_growth_round(r,p,precision)
    p=precision(p)
    r=precision(r)
    for i in 1:40
        p=p+r*p*(1-p)
        if(i==10)
            p=trunc(p,digits=3)
            println("Should be 0.722: ",p)
        end
    end
    println(p)
    end
population_growth((3.0),(0.01),Float32)
population_growth_round((3.0),(0.01),Float32)
