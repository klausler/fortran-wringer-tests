! What happens when absent OPTIONAL dummy arguments are passed to MAX()?
! (Note that MAX's first two argument are not optional.)
! GNU: 5., 4., 2., 1., crash
! Intel: 5., 4., 2., 1., -3.4028235E+38
! NVF, XLF: 5., crash
! f18: 5., 4., 2., crash
module m
 contains
  real function mymax(a1,a2,a3,a4,a5)
    real, intent(in), optional :: a1, a2, a3, a4, a5
    mymax = max(a1, a2, a3, a4, a5)
  end function
end module

use m
print *, mymax(1.,2.,3.,4.,5.); flush(6)
print *, mymax(1.,2.,3.,4.); flush(6)
print *, mymax(1.,2.); flush(6)
print *, mymax(1.); flush(6)
print *, mymax()
end
