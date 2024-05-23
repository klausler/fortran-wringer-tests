! What's the rank of NULL()?
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
