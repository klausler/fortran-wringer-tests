! What's MODULO(-HUGE(0.),TINY(0.)) and MODULO(HUGE(0.),-TINY(0.))?
real :: h = huge(0.), t = tiny(0.)
print *, modulo(-h,t), modulo(h,-t)
end
