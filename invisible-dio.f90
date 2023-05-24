! When a non-TBP defined I/O generic is not in the scope of a call,
! is it used?
! GNU, NAG, XLF, f18: correct
! Intel: test1 fails
! NVF: test2 fails
module m1
  type t
    integer n
  end type
  interface write(formatted)
    module procedure wft
  end interface
 contains
  subroutine wft(dtv, unit, iotype, v_list, iostat, iomsg)
    class(t), intent(in) :: dtv
    integer, intent(in) :: unit
    character(*), intent(in) :: iotype
    integer, intent(in) :: v_list(:)
    integer, intent(out) :: iostat
    character(*), intent(inout) :: iomsg
    iostat = 0
    write(unit,*,iostat=iostat,iomsg=iomsg) 'wft was called: ', dtv%n
  end subroutine
end module
module m2
 contains
  subroutine test1
    use m1
    print *, 'test1, should call wft: ', t(1)
  end subroutine
  subroutine test2
    use m1, only: t
    print *, 'test2, should not call wft: ', t(2)
  end subroutine
end module

use m1
use m2
call test1
call test2
print *, 'main, should call wft: ', t(3)
end
