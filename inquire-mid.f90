! INQUIRE(POSITION=) after positioning
! GNU:   ASIS, REWIND, APPEND,    UNSPECIFIED, REWIND, REWIND, APPEND
! Intel: ASIS, REWIND, UNDEFINED, UNDEFINED,   REWIND, REWIND, APPEND
! NVF:   ASIS, ASIS,   ASIS,      ASIS,        ASIS,   REWIND, APPEND
! NAG:   ASIS, REWIND, APPEND,    UNKNOWN,     REWIND, REWIND, APPEND
! XLF:   ASIS, REWIND, APPEND,    ASIS,        REWIND, REWIND, APPEND
! f18:   ASIS, ASIS,   ASIS,      APPEND,      APPEND, REWIND, APPEND
character(len=16) :: inq
open(7,file="pmk.tmp",access="sequential",status="replace",form="unformatted")
inquire(7,position=inq)
print *, 'after open: ', inq
rewind(7)
inquire(7,position=inq)
print *, 'after rewind: ', inq
write(7) 1
inquire(7,position=inq)
print *, 'after write: ', inq
write(7) 2
backspace(7)
inquire(7,position=inq)
print *, 'after backspace: ', inq
rewind(7)
inquire(7,position=inq)
print *, 'after rewind: ', inq
close(7)
open(7,file="pmk.tmp",access="sequential",status="old",position="rewind",form="unformatted")
inquire(7,position=inq)
print *, 'after second open with rewind: ', inq
close(7)
open(7,file="pmk.tmp",access="sequential",status="old",position="append",form="unformatted")
inquire(7,position=inq)
print *, 'after third open with append: ', inq
end
