! SPACING(very small values)
! GNU, Intel, NVF: all 0.11754943508222875080E-37 (tiny(0.))
! NAG, f18: tiny(0.), 0.14012984643248170709E-44 (smallest), tiny(0.),
!                     smallest, tiny
! XLF, f18: tiny(0.), rest smallest
print '(E30.20)', tiny(0.)
print '(E30.20)', spacing(tiny(0.))
print '(E30.20)', spacing(spacing(tiny(0.)))
print '(E30.20)', foo(tiny(0.)) ! prevent folding
print '(E30.20)', foo(foo(tiny(0.))) ! prevent folding
end

real function foo(x)
  foo = spacing(x)
end
