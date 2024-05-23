! Can a dummy procedure be used in a defined I/O generic interface?
module m
  type t
    integer n
  end type
 contains
  subroutine wf(dtv, unit, iotype, v_list, iostat, iomsg)
    class(t), intent(in) :: dtv
    integer, intent(in) :: unit
    character(*), intent(in) :: iotype
    integer, intent(in) :: v_list(:)
    integer, intent(out) :: iostat
    character(*), intent(inout) :: iomsg
    iostat = 0
    write(unit,*,iostat=iostat,iomsg=iomsg) 'wf: ', dtv%n
  end subroutine
  subroutine dummydio(p, x)
    procedure(wf) p
    class(t), intent(in) :: x
    interface write(formatted)
      procedure p
    end interface
    print *, x
  end subroutine
end module

program main
  use m
  call dummydio(wf, t(123))
end
