#Piotr Popis
f1(x)=ℯ^(1-x)-1
pf1(x) = -exp(1-x)
f2(x)=x*ℯ^(-x)
pf2(x) = -exp(-x) * (x-1)
println("----------------------BISEC-----------------------")
println(mbisekcji(f1,0.0,2.0,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f1,-4.0,4.0,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f1,0.0,1.5,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f1,-1.0,250.0,10.0^(-5.0),10.0^(-5.0)))
println("---------------------------------------------")
println(mbisekcji(f2,-0.5,0.5,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f2,-0.4,0.3,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f2,-1.0,5.0,10.0^(-5.0),10.0^(-5.0)))
println(mbisekcji(f2,-42.7,13.4,10.0^(-5.0),10.0^(-5.0)))
println("---------------------------------------------")
println("-------------------NEWTON--------------------------")
println(mstycznych(f1,pf1,0.999,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f1,pf1,0.0,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f1,pf1,-0.95,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f1,pf1,-10.0,10.0^(-5.0),10.0^(-5.0),50))
println("---------------------------------------------")
println(mstycznych(f2,pf2,-0.999,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f2,pf2,-2.5,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f2,pf2,-5.0,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f2,pf2,-10.0,10.0^(-5.0),10.0^(-5.0),50))
println("---------------------------------------------")
println("-------------------SIECZ--------------------------")
println(msiecznych(f1,0.8,0.9,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-1.0,0.9,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-1.0,0.5,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-2.5,0.5,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-1.0,-0.1,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,3.0,5.0,10.0^(-5.0),10.0^(-5.0),50))
println("---------------------------------------------")
println(msiecznych(f1,-0.2,-0.01,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-1.0,-0.5,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-2.0,-0.999,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-2.5,0.5,10.0^(-5.0),10.0^(-5.0),50))
println(msiecznych(f1,-7.0,-4.0,10.0^(-5.0),10.0^(-5.0),50))
println("-----------------------WHATIF----------------------")
println(mstycznych(f1,pf1,1.0,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f1,pf1,50.0,10.0^(-5.0),10.0^(-5.0),50))
println("---------------------------------------------")
println(mstycznych(f2,pf2,1.0,10.0^(-5.0),10.0^(-5.0),50))
println(mstycznych(f2,pf2,5.0,10.0^(-5.0),10.0^(-5.0),50))
