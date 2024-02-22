! Are errors with ASYNCHRONOUS also caught when the attribute is
! implied by usage rather than explicitly declared?
! GNU: 3 out of 4 cases
! f18, XLF: yes (4/4)
! Intel, NVF, NAG: no
module m
 contains
  subroutine s1(x)
    real, asynchronous, intent(in out), contiguous :: x(:)
  end
  subroutine s2(x)
    real, intent(in out), contiguous :: x(:)
    read(1,id=id,asynchronous="yes") x
  end
  subroutine t1(x)
    real, asynchronous, intent(in out) :: x(:)
    call s1(x)
    call s2(x)
  end
  subroutine t2(x)
    real, intent(in out) :: x(:)
    read(1,id=id,asynchronous="yes") x
    call s1(x)
    call s2(x)
  end
end

program test
  print *, 'fail'
end
