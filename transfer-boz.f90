! Can BOZ be a source for TRANSFER?
! GNU, f18: no, compilation error
! Intel, NVF, NAG: yes, 1.0
! XLF: yes, 0.4600602988E-40
real x
x = transfer(z'3F800000', 0.0)
print *, x
end
