! Does a "null" item in list-directed input cause the corresponding
! effective input item to be left unmodified even if it has a defined
! formatted input subroutine?
module m
  type t
    integer :: n = 1
   contains
    procedure :: rf
    generic :: read(formatted) => rf
  end type
 contains
  subroutine rf(dtv, unit, iotype, vlist, iostat, iomsg)
    class(t), intent(inout) :: dtv
    integer, intent(in) :: unit
    character(*), intent(in) :: iotype
    integer, intent(in) :: vlist(:)
    integer, intent(out) :: iostat
    character(*), intent(inout) :: iomsg
    dtv%n = 2
    read (unit, *, iostat=iostat, iomsg=iomsg) dtv%n
  end
end

program main
  use m
  type(t) x
  character(2) :: input = ",3"
  read(input, *) x
  print *, x
end
