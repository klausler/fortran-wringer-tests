! The standard (F'23 13.10.4) is pretty clear about when list-directed
! output should not emit a blank to separate output items, including
! this case of defined output.
! GNU, XLF: "a b"
! Intel, NAG, f18: "ab"
! NVF: "a" and "b" on two lines
module m
  type t
    character a
   contains
    procedure :: wft
    generic :: write(formatted) => wft
  end type
 contains
  subroutine wft(dtv, unit, iotype, v_list, iostat, iomsg)
    class(t), intent(in) :: dtv
    integer, intent(in) :: unit
    character(*), intent(in) :: iotype
    integer, intent(in) :: v_list(:)
    integer, intent(out) :: iostat
    character(*), intent(inout) :: iomsg
    write(unit,'(a1)', iostat=iostat, iomsg=iomsg) dtv%a
  end
end

program main
  use m
  type(t) a(2)
  a(1)%a = 'a'
  a(2)%a = 'b'
  print *, a
end
