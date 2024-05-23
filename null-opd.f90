! NULL() as operand to defined operator
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
