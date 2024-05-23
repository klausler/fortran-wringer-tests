! Result of INQUIRE on a closed unit
character*20 :: pad
close(5)
inquire(5,pad=pad)
print *, trim(pad)
end
