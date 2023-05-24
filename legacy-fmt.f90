! Can a REAL array be used as a format?
! GNU: no
! Intel, NVF, NAG, XLF: yes, "hi !"
! f18: no error, but codegen NYI
real x(2)
data x/4h('hi, 4h !')/
print x
end
