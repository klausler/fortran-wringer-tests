! Result of INQUIRE on a closed unit
! GNU, NAG, XLF, f18: UNDEFINED
! Intel, NVF: YES
character*20 :: pad
close(5)
inquire(5,pad=pad)
print *, trim(pad)
end
