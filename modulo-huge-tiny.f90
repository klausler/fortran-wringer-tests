! What's MODULO(-HUGE(0.),TINY(0.)) and MODULO(HUGE(0.),-TINY(0.))?
! GNU, NAG: 0, -0
! Intel: Inf, -Inf
! NVF, XLF, f18: -0, 0
real :: h = huge(0.), t = tiny(0.)
print *, modulo(-h,t), modulo(h,-t)
end
