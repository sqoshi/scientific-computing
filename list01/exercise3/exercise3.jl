#Piotr Popis

function uniformity(δ)
    for k in 1:5 #(((δ)^(-1))-1)
        println(bitstring(Float64(1.0 + k*δ)))
    end
end


println("[1, 2]: ")
uniformity(Float64((0.5)^(52.0)))
println("--------------------------")
println("[0,5, 1]: ")
uniformity(Float64((0.5)^(53.0)))#(0.5)^(52.0)*0,5^1
println("--------------------------")
println("[2, 4]: ")#(0.5)^(52.0)/0,5^1
uniformity(Float64((0.5)^(51.0)))
println("--------------------------")
