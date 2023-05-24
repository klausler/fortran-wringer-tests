! Does NAMELIST input skip over characters before &NML?
! NAG: no, runtime error
! GNU, Intel, NVF, XLF, f18: yes
character(80) :: internal(7) = [ character(80) :: &
  "namelist comment without !", &
  "&other", &
  " j = 666", &
  "/", &
  "&nml", &
  " j = 123", &
  "/" ]
integer :: j = -1
namelist/nml/j
namelist/other/j
read(internal,nml=nml)
print *, j
end
