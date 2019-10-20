#=
Piotr Popis
=#
"""
Function that finds floating point type number in given range.
"""
function experiment()
    x=1.0
    while (Float64(x)<2.0)
         while (Float64(x*Float64(1.0/x))!=1.0)
        return x
    end
        x=nextfloat(x)
    end

end
println(experiment())
