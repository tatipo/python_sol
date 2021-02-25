"""
A collection of simple math operations
"""

def simple_add(a,b):
"""
sum of two input numbers
"""
    return a+b

def simple_sub(a,b):
"""
substraction of two input numbers
"""
    return a-b

def simple_mult(a,b):
"""
multiplication of two input numbers
"""
    return a*b

def simple_div(a,b):
"""
division of two input numbers
"""
    return a/b

def poly_first(x, a0, a1):
"""
polynom of first order, two input numbers
"""
    return a0 + a1*x

def poly_second(x, a0, a1, a2):
"""
polynom of second order, three input numbers
"""
    return poly_first(x, a0, a1) + a2*(x**2)
