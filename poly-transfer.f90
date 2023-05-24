! What happens when an unlimited polymorphic is the mold of TRANSFER?
! GNU, Intel, NVF: error, "selector shall be polymorphic"
! NAG, XLF: compiles, then sigsegv at runtime
! f18: compiler crash
module m
 contains
  subroutine foo(mold)
    class(*), intent(in), optional :: mold
    select type (assoc => transfer(666, mold))
    type is (real)
      print *, 'real'
    type is (integer)
      print *, 'real'
    class default
      print *, 'not real'
    end select
  end subroutine
end module

program main
  use m
  call foo
end
