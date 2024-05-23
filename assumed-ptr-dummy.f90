! Can a procedure pointer dummy argument be assumed-length?
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
