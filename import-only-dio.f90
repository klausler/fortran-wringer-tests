! Can IMPORT,ONLY be used to disable a non-TBP defined I/O generic
! interface?
module m
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
  subroutine test1
    import, all
    print *, 'test1 outer, should call wft: ', t(1)
    block
      import, only: t
      print *, 'test1 block, should not call wft: ', t(2)
    end block
  end subroutine
  subroutine test2
    import, only: t
    print *, 'test2, should not call wft: ', t(3)
  end subroutine
end module

use m
call test1
call test2
print *, 'main, should call wft: ', t(4)
end
