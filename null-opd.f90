! NULL() as operand to defined operator
! GNU, XLF, f18: ok, print F
! Intel: error, "invalid context for NULL(...)"
! NVF: compiler crash
! NAG: error, "MOLD argument ... is required"
module m
  interface operator(+)
    procedure f
  end interface
 contains
  logical function f(x, y)
    logical, pointer, intent(in) :: x, y
    f = .false.
  end function
end module

program main
  use m
  print *, null() + null()
end
