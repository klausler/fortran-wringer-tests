! Can a procedure pointer dummy argument be assumed-length?
! GNU, IFX: yes
! f18: yes, with portability warning
! ifort: compiler crash ("feature not yet supported")
! NAG: compiler crash ("Not a Uindex")
! XLF: no error, blank runtime output
module m
 contains
  subroutine subr(p)
    procedure(character(*)), pointer :: p
    print *, p()
  end subroutine
end module

character(*) function f()
  f = 'abcdefgh'
end function

program test
  use m
  character(4), external :: f
  procedure(character(4)), pointer :: p
  p => f
  call subr(p)
end
