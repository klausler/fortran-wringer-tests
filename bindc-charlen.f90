! Extension: must CHARACTER arguments and components have only length 1
! in a BIND(C) context?
! GNU, NAG, XLF: yes
! NVF: accepted
! Intel, f18: accepted with warning
module m
  type, bind(c) :: t
    character(8) str
  end type
 contains
  subroutine chsubr(x) bind(c)
    character(*), intent(out) :: x
    x = 'abcdefgh'
  end
end

program main
  use m
  character(8) x
  call chsubr(x)
  print *, x
end
