! Using a subroutine pointer as function result
module m
 contains
  recursive function foo()
    procedure(bar), pointer :: foo
    foo => bar
    call foo
  end function
  recursive subroutine bar
    print *, 'in bar'
  end subroutine
end module

program demo
  use m
  procedure(bar), pointer :: p
  p => foo()
  call p
end
