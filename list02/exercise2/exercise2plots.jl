#Piotr Popis
using Plots
"""
range for a plot.
"""
in = range(-10, stop=1000,step=0.01)
"""
logharitm natural function own.
"""
function logharitm_e(x)
  return log(exp(1), x)
end
"""
given function.
"""
function f(x)
  return (exp(1)^x) * logharitm_e(1 + exp(-x))
end

array = [f(x) for x = in]

plot(array)

png("/home/piotr/Documents/scientific-computing/list02/exercise2/PlotLimited.png")
