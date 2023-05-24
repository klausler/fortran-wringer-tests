! Can HUGE(1.d0) be accurately formatted?
! GNU, NVF, f18: yes
! Intel: asterisks
! NAG, XLF: silent rounding with zero fill
print '(E330.320)', huge(1.d0)
end
