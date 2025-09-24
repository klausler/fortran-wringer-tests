module m
  type t
    integer n(2)
   contains
    procedure rf
    generic :: read(formatted) => rf
  end type
 contains
  subroutine rf(dtv, unit, iotype, v_list, iostat, iomsg)
    class(t), intent(inout) :: dtv
    integer, intent(in) :: unit
    character(*), intent(in) :: iotype
    integer, intent(in) :: v_list(:)
    integer, intent(out) :: iostat
    character(*), intent(inout) :: iomsg
    dtv%n = -666
    read(unit,*,iostat=iostat,iomsg=iomsg) dtv%n
  end
end

program main
  use m
  character(3) :: input(2) = ["123", "234"]
  type(t) x
  integer iostat
  x%n = -666
  iostat = 0
  read(input,*,iostat=iostat) x%n
  print *, iostat, x
  iostat = 0
  read(input,*,iostat=iostat) x
  print *, iostat, x
end
