! May one use a unary negation as the second operand of a
! binary operator without parentheses?
! GNU, Intel, NVF, f18: yes
! NAG, XLF: no
   program nonUnary
   implicit none
   integer i,j,k,m
   real x,y,z
   i = 3
   j = 2+-i*i
   k = 2+-3*-3
   m = 2+-i**2
   print *,i,j,k,m
   x = 2.0**-3
   y = 2.0**-i
   z = 1.0+-x**-3
   print *,x,y,z
   end
