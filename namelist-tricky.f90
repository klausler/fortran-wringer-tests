! Tricky NAMELIST input: is the second "t" interpreted as .true. or
! as a variable name?
character*16 :: input(2) = ["&n la=t t", " = 1 /   "]
logical :: la(2) = .false.
integer :: t = 666
namelist/n/la, t
read(input, nml=n)
print *, la, t
end
