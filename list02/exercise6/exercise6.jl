#Piotr Popis
using Plots
function recursion(x,c)
    return (x^2 + c)
end

function repeat_func(times)
    c = Float64[-2,-2,-2,-1,-1,-1,-1]
    x = Float64[1,2,1.99999999999999,1,-1,0.75,0.25]
    a = Float64[1:40;]
    for i in 1:times
        x[1]=recursion(x[1],c[1])
        x[2]=recursion(x[2],c[2])
        x[3]=recursion(x[3],c[3])
        x[4]=recursion(x[4],c[4])
        x[5]=recursion(x[5],c[5])
        x[6]=recursion(x[6],c[6])
        x[7]=recursion(x[7],c[7])
        println(i," : ",x[1]," : ",x[2]," : ",x[3]," : ",x[4]," : ",x[5]," : ",x[6]," : ",x[7])
        a[i]=x[7]
    end
    print(a)
    b = 1:40; y = a;
    plot(b,y,framestyle = :origin)
    png("/home/piotr/Documents/scientific-computing/list02/exercise6/plots/plot7.png")

end
println("----------------------------------------------------")
repeat_func(40)
