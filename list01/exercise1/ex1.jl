#Piotr Popis

"""
Function that determines the  macheps
 for concrete floating point type.

"""
function determine_macheps(FPT)
macheps=1.0

while FPT(1.0+macheps/2)>1.0
    macheps/=2
end
return macheps
end

"""
Function that determines eta.
eta is the minimal number that eta>0 shows true.
"""
function determine_eta(FPT)
eta=1.0
while FPT(eta/2)>0.0
    eta/=2
end
return eta
end
"""
Function that determines the MAX for each floating point type.
"""
function determine_max(FPT)
max = FPT(1.0)
while !isinf(FPT(2.0*max))
    max*=2.0
end
return FPT((2.0-eps(FPT))*max)
end


#Compute Results
println("----------------macheps--------------------")
println("FPT:  eps(FPT)  -  determine_macheps(FPT)")
println("Float16: ",eps(Float16), " - ",determine_macheps(Float16))
println("Float32: ",eps(Float32), " - ",determine_macheps(Float32))
println("Float64: ",eps(Float64), " - ",determine_macheps(Float64))
println("---------------------------------------")

println("----------------eta--------------------")
println("FPT:  determine_eta(FPT) - nextfloat(FPT)")
println("Float16: ",determine_eta(Float16)," - ",nextfloat(Float16(0.0)))
println("Float32: ",determine_eta(Float32)," - ",nextfloat(Float32(0.0)))
println("Float64: ",determine_eta(Float64)," - ",nextfloat(Float64(0.0)))
println("---------------------------------------")

println("----------------MAX--------------------")
println("FPT: determine_max(FPT) - floatmax(FPT)")
println("Float16: ",determine_max(Float16)," - ",floatmax(Float16))
println("Float32: ",determine_max(Float32)," - ",floatmax(Float32))
println("Float64: ",determine_max(Float64)," - ",floatmax(Float64))
println("---------------------------------------")
