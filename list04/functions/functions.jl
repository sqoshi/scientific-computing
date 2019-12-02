#Piotr Popis
module functions
using Plots

export ilorazyRoznicowe
export warNewton
export rysujNnfx
export naturalna
"""
Oblicza ilorazy roznicowe na podsatwie podanego wektora wezlow oraz wartosci funkcji.
"""
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})

    n = length(f)
    fx = Vector{Float64}(n)

    for i = 1:n
        fx[i] = f[i]
    end

    for i = 2:n
        for j = n:-1:i
            fx[j] = (fx[j] - fx[j-1]) / (x[j] - x[j - i + 1])
        end
    end

    return fx
end

"""
Oblicza wartosc wielomianu w zadanym punkcie w formie Newtona uzyywajac algorytmu Horner'a
"""
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)

   N = length(x)
   nt = fx[N]

   for k = N-1 : -1 : 1
       nt = fx[k] + (t - x[k])*nt
   end

   return nt
end



end