! What's the rank of NULL()?
! GNU, ifort, XLF: 0
! ifx: 1
! NVF: "rank_" unsatisfied external
! NAG: assumed-rank is a syntax error
module m
 contains
  subroutine subr(p)
    real, pointer :: p(..)
    print *, rank(p)
  end
end

program main
  use m
  call subr(null())
end
