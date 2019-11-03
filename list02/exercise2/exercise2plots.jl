using Plots
in = range(30, stop=40, step=0.01)

function logharitm_e(x)
  return log(exp(1), x)
end

function f(x)
  return (exp(1)^x) * logharitm_e(1 + exp(-x))
end

array = [f(x) for x = in]

plot(array)

png("/home/piotr/Documents/scientific-computing/list02/exercise2/PlotLimited.png")
