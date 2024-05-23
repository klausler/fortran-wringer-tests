! Default bit patterns and interpretations for LOGICAL
logical :: log
integer :: int
equivalence(log,int)
log = .false.
print *, ".false.", int
log = .true.
print *, ".true.", int
do j = -2, 2
  int = j
  if (log) then
    print *, int, " is .true."
  else
    print *, int, " is .false."
  end if
end do
end

