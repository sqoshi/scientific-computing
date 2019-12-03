#Piotr Popis
using Plots
using LinearAlgebra
export ilorazyRoznicowe
export warNewton
export rysujNnfx
export naturalna
"""
Oblicza ilorazy roznicowe na podsatwie podanego wektora wezlow oraz wartosci funkcji.
n - dlugosc wektora f
"""
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    N = length(x)
    fx = Vector{Float64}(undef, N)

    for k = 1 : N;
        fx[k] = f[k]
    end
    for k = 2 : N;
        for i = N : -1 : k
            fx[i] = (fx[i] - fx[i-1]) / (x[i] - x[i - k + 1])
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

"""
Oblicza wartość wspolczynnikow postaci naturalnej wielomianu zadanego w postaci Newton'a
"""
function naturalna(a::Vector{Float64}, fdiff::Vector{Float64})
    n = length(fdiff)
    coeff =Vector{Float64}(undef, n)
    coeff[n] = fdiff[n]

    for i = n-1:-1:1
        # TODO: CHANGE
        p = coeff[i+1] * a[i]
        coeff[i] = fdiff[i] - p

        for k = i+1:n-1
            # TODO: CHANGE
            p = coeff[k+1] * a[i]
            coeff[k] = coeff[k] - p
        end
    end

    return coeff
end
"""
Rysuje wielomian interpolacyjne i interpolowa funkcje w przedziale [a, b]
"""
function rysujNnfx(f,a::Float64,b::Float64,n::Int)
  h = (b - a) / n;
  x = Array(Float64, n + 1);
  y = Array(Float64, n + 1);

  for i=1 : n + 1
    x[i] = a + (i-1) * h;
    y[i] = f(x[i]);
  end

  fx = ilorazyRoznicowe(x, y);
  closeness = 101;
  functionResults = Array(Float64, closeness);
  interpResults = Array(Float64, closeness);
  h1 = (b - a) / (closeness-1);
  for i=1 : closeness
    t = a + (i-1) * h1;
    functionResults[i] = f(t);
    interpResults[i] = warNewton(x, fx , t);
  end

  plot(linspace(a, b, closeness), functionResults, color ="blue", label = "functionResults")
  plot!(linspace(a, b, closeness), interpResults, color ="red", label="interpResults")
end
