! Can NULL() be associated with an allocatable dummy argument?
! GNU, f18: compilation error
! Intel, NVF: prints F and crashes with sigsegv
! NAG, XLF: print F and 3.14159
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
