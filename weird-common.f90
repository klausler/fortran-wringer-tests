! Can a common block name have the same name as something else in scope?
real :: x, y
common /block/ x
common /sin/ y
intrinsic :: sin
real, parameter :: block = 123
print *, 'ok'
end
