! What's the result of MAX/MIN when the operands are
! both zero and at least one of them is an IEEE -0.0?
program main
  real :: x = real(z'80000000', kind(x))
  real :: y = real(z'00000000', kind(y))
  call sub('max', x, x, max(x, x))
  call sub('max', x, y, max(x, y))
  call sub('max', y, x, max(y, x))
  call sub('max', y, y, max(y, y))
  call sub('min', x, x, min(x, x))
  call sub('min', x, y, min(x, y))
  call sub('min', y, x, min(y, x))
  call sub('min', y, y, min(y, y))
 contains
  subroutine sub(a, x, y, z)
    character(3), intent(in) :: a
    real, intent(in) :: x, y, z
1   format(A, SP, 3(1X, I12, F5.1))
    print 1, a, transfer(x,1), x, transfer(y,1), y, transfer(z,1), z
  end
end
