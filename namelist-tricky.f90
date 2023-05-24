! Tricky NAMELIST input: is the second "t" interpreted as .true. or
! as a variable name?
! GNU, Intel: runtime error on second "="
! NVF, NAG, XLF, f18: no error, print "T F 1"
character*16 :: input(2) = ["&n la=t t", " = 1 /   "]
logical :: la(2) = .false.
integer :: t = 666
namelist/n/la, t
read(input, nml=n)
print *, la, t
end
