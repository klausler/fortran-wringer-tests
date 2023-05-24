! INQUIRE(POSITION=) on unit 5
! GNU, NVF, NAG, f18: ASIS
! Intel: REWIND
! XLF: runtime error (illegal seek)
character(8) :: ch
inquire(unit=5,position=ch)
print *, ch
end
