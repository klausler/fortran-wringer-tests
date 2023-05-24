! Can a common block name have the same name as something else in scope?
! GNU, XLF: errors on intrinsic and parameter
! Intel, NVF, f18: no error, "ok"
! NAG: error on parameter, not intrinsic
real :: x, y
common /block/ x
common /sin/ y
intrinsic :: sin
real, parameter :: block = 123
print *, 'ok'
end
