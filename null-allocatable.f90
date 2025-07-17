program main
  real, allocatable :: a
  call subr1(null(mold=a))
  call subr2(null(mold=a))
  call subr3(null(mold=a))
  call subr4(null(mold=a))
 contains
  subroutine subr1(x)
    real, allocatable, intent(in) :: x
  end
  subroutine subr2(x)
    real, allocatable :: x
  end
  subroutine subr3(x)
    real, allocatable, intent(in out) :: x
  end
  subroutine subr4(x)
    real, allocatable, intent(out) :: x
  end
end

