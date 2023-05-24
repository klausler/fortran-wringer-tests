! What happens when a DO index variable is modified in the loop?
! NVF, XLF, f18: print 2 4 6 8 10 12 14 16 18 20
! GNU, Intel, NAG: print 2 4 6 8 10
subroutine foo(i)
  i = i + 1
end
program test
  do i = 1, 10
    call foo(i)
    print *, i
  end do
end
