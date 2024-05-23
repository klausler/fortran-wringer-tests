! Can functions and subroutines both appear in a generic interface?
module m1
  interface generic
    module procedure func
  end interface
 contains
  integer function func(n)
    integer, intent(in) :: n
    func = n
  end function
end module

module m2
  interface generic
    module procedure subr
  end interface
 contains
  subroutine subr
    print *, 'ok'
  end subroutine
end module

program main
  use m1
  use m2
  call generic
end
