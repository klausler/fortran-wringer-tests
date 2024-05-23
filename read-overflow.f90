! Is a real overflow a fatal error on formatted input?
real x
character(8) :: in = " 1.0E999";
read(in,*) x
print *, x
end
