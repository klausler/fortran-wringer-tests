! How does SPACING behave with subnormal arguments?
! Can SPACING return subnormal results?
module pk
  integer, parameter :: p = kind(0.)
end

use pk
real(p), parameter :: t = tiny(0._p)
real(p) vt
common /blk/ vt
real(p) a
print "('tiny', t20, e30.20)", t
k = 0
do j = 0, 200
  a = transfer(k, a)
  k = k + k
  print "(e30.20, t40, e30.20, ' <=')", a, spacing(a)
  if (a == t) exit
end do
do j = 1, 100
  a = a + a
  print "(e30.20, t40, e30.20, i4)", a, spacing(a), j
  if (spacing(a) > t) exit
end do
end

block data
use pk
real(p) :: vt = tiny(0._p)
common /blk/ vt
end
