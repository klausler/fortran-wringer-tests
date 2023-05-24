! Is implicitly typed "m" host associated or not?
! GNU, NVF, NAG: "3 should be 3"
! ifort, XLF: "2 should be 3"
! ifx: "0 should be 3"
! f18: Implicitly typed local entity 'm' not allowed in specification expression
module module
 contains
  subroutine host(j)
    integer, intent(in out) :: j
    call inner1(j)
    call inner2(j)
   contains
    subroutine inner1(n)
      integer(kind(m)), intent(in) :: n
      m = n + 1
    end subroutine
    subroutine inner2(n)
      integer(kind(m)), intent(out) :: n
      n = m + 2
    end subroutine
  end subroutine
end module

program demo
  use module
  integer :: k
  k = 0
  call host(k)
  print *, k, " should be 3"
end
