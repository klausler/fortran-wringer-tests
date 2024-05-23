! Finalization of function results
module m
  type t
    integer component
   contains
    final :: final
  end type
 contains
  elemental subroutine final(x)
    type(t), intent(in out) :: x
    interface
      pure subroutine sneaky(j)
        integer, intent(in) :: j
      end subroutine
    end interface
    call sneaky(x%component)
  end subroutine
  pure integer function get_component(x)
    type(t), intent(in) :: x
    get_component = x%component
  end function
  pure function wrap(n)
    integer, intent(in) :: n
    type(t) wrap
    wrap = t(n)
  end function
end module

subroutine sneaky(j)
  integer, intent(in) :: j
  print *, 'sneaky ', j
end subroutine

subroutine demo
  use m
  real a(get_component(wrap(10)))
  print *, 'size(a)', size(a)
end subroutine

program main
  call demo
end
