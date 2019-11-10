#Piotr Popis
"""
Calculate limit of given function in oo.
"""
using  SymPy
x=Sym("x")
print(" Limit = ",limit((ℯ^x)*log(1+ℯ^(-x)),x,oo))
