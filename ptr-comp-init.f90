! Can pointer components have default initialization?
! GNU: compiler sigsegv
! Intel, f18: works, good output
! NVF, XLF: syntax error
! NAG: compilation errors, "XS is not permitted in a constant expression"
module m1
  real, target :: xs(3,3) = reshape([(j, j=1,9)],[3,3])
  real, target :: pi = 3.14159
  type :: t1
    real, pointer :: p2b(:,:) => xs
    real, pointer :: p0 => pi
  end type
end module

use m1
type(t1), allocatable :: x
allocate(x)
print *, x%p2b
print *, x%p0
end
