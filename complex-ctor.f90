! Extension: can a non-literal-constant expression be part of a
! complex constructor?
! GNU, NVF, NAG: no
! Intel, XLF, f18z; yes
real :: a
a = 3.
print *, (a+1.,a-1.)
end
