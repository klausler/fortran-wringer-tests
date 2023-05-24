! Can a pointer be initialized to real components of a slice?
! GNU: sigsegv at runtime
! Intel: initializer interpreted as expression, not designator
! NVF, XLF: bogus syntax errors
! NAG: bogus uninitialized pointer error
! f18: works
complex, save, target :: a(4) = [(1.,0.),(2.,0.),(3.,0.),(4.,0.)]
real, pointer :: p(:) => a(1:3:2)%re
print *, p
end
