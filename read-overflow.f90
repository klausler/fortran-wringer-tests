! Is a real overflow a fatal error on formatted input?
! GNU, NVF, XLF: no, returns Infinity
! Intel, NAG, f18: yes
real x
character(8) :: in = " 1.0E999";
read(in,*) x
print *, x
end
