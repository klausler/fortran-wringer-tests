! Can NULL() be associated with an allocatable dummy argument?
program test
  call subr1(null())
 contains
  subroutine subr1(a)
    real, allocatable :: a
    print *, allocated(a)
    flush(6)
    allocate(a)
    a = 3.14159
    print *, a
  end subroutine
end
