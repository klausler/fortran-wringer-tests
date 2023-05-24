! When two generics, each with homonymous specifics, are use-associated
! into a scope, is an error reported?
! GNU, NVF: yes, but it's due to failing to catch p1 ambiguity
! Intel: weird undefined external linker messages about p1
! NAG, XLF, f18: yes
module m1
  interface foo
    module procedure foo
  end interface
 contains
  real function foo()
    foo = 0.
  end
end

module m2
  interface foo
    module procedure foo
  end interface
 contains
  real function foo(x)
    foo = x
  end
end

subroutine test1
  use m1
  use m2
  print *, foo(), foo(1.)
end

subroutine test2
  use m1
  use m2
  procedure(foo), pointer :: p1 ! ambiguous
  p1 => foo ! ambiguous
  print *, p1()
  print *, p1(1.)
end

call test1
call test2
end
