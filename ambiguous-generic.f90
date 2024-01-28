! (From pFUnit) Is this generic interface acceptable?
! GNU, Intel, NVF, NAG: yes
! XLF, f18: violates F'2023 15.4.3.4.5
module m
  interface generic
    procedure sub1, sub2
  end interface
 contains
  subroutine sub1(b, c)
    class(*) b
    integer, optional :: c
  end
  subroutine sub2(a, b, c)
    real a
    class(*) b
    integer, optional :: c
  end
end
