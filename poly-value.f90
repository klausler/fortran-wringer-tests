! Can a VALUE dummy argument be polymorphic?
! GNU, Intel: yes
! NVF, NAG, XLF: no
module m
  type t
  end type
 contains
  subroutine poly(a, b)
    class(t), value, intent(in) :: a
    class(*), value, intent(in) :: b
    print *, 'ok'
  end
end module

program p
  use m
  type, extends(t) :: ext
  end type
  call poly(ext(), ext())
end

