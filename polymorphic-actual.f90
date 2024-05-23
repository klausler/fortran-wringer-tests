module m
  type t
    integer m
  end type
  type, extends(t) :: t2
    integer n
  end type
 contains
  subroutine passToImplicit(a, n)
    integer :: n
    class(t) :: a(n)
    external implicitInterface
    call implicitInterface(a, n)
  end
end

subroutine implicitInterface(a, n)
  use m
  integer :: n
  type(t) a(n)
  print *, 'got: ', a
  a%m = a%m * 2
end

program test
  use m
  integer, parameter :: n = 3
  type(t2) a(n)
  a = [t2(1,2), t2(3,4), t2(5,6)]
  print *, 'before: ', a
  call passToImplicit(a, n)
  print *, 'after: ', a
  print *, 'expect: 2 2 6 4 10 6'
end
