! Result of INQUIRE on a directory
! True: GNU, NAG, NVF, XLF, f18, Cray
! False: Intel
logical :: is_file
inquire(file=".", exist=is_file)
print *, is_file
end
