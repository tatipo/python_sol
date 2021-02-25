# test_simple_math.py
import simple_math
import pytest

a=6;
b=3;
x=1;
a0=1.2;
a1=1.3;
a2=1.4;
# the name of the testing function should
# also start with test_
def test_sm_add():
	assert simple_math.simple_add(a,b) == 9

def test_sm_sub():
	assert simple_math.simple_sub(a,b) == 3
	
def test_sm_mult():
	assert simple_math.simple_mult(a,b) == 18
	
def test_sm_div():
	assert simple_math.simple_div(a,b) == 2
	
def test_sm_poly1():
	assert simple_math.poly_first(x,a0,a1) == 2.5
	
def test_sm_poly2():
	assert simple_math.poly_second(x,a0,a1,a2) == 3.9
