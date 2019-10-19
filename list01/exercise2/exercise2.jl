#Piotr Popis
function determine_kahan_macheps(FPT)
    return FPT(FPT(3.0)*FPT(FPT(FPT(4.0)/FPT(3.0))-FPT(1.0))-FPT(1.0))
end
println("FPT :  Kahan's macheps - eps")
println("Float 16: ",determine_kahan_macheps(Float16)," - ",eps(Float16))
println("Float 32: ",determine_kahan_macheps(Float32)," - ",eps(Float32))
println("Float 64: ",determine_kahan_macheps(Float64)," - ",eps(Float64))
