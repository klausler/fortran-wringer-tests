! Extension: can a non-literal-constant expression be part of a
! complex constructor?
real :: a
a = 3.
print *, (a+1.,a-1.)
end
