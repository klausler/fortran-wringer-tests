! Using a subroutine pointer as function result
! NVF: works, prints "in bar" twice
! GNU, Intel: compiler crash
! NAG: bogus compilation error on "call foo" ("duplicate subprogram name FOO")
! XLF: bogus compilation error on "call foo" ("foo was defined... as a function")
! f18: no error, procedure pointer function result NYI in code gen
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
