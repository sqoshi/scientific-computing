#Piotr Popis
"""
"""
function population_growth(r,p)
for i in 1:40
    p=p+r*p*(1-p)
end
println(p)
end
"""
"""
function population_growth_round(r,p)
    for i in 1:40
        p=p+r*p*(1-p)
        if(i==10)
            p=trunc(p,digits=3)
            println("round: ",p)
        end
    end
    println(p)
    end
population_growth(Float32(3.0),Float32(0.01))
population_growth_round(Float32(3.0),Float32(0.01))
