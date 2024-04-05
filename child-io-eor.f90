! End-of-record conditions during child I/O.
! Behaviors vary wildly and no two compilers do the same thing.
! (I believe f18 is correct per the Fortran standard.)
! f18: x 123 0 234 0 iostat -2 which 4 iomsg End of record during non-advancing input
! GNU: x         123           0           0           0 iostat          -1 which           2 iomsg End of file
! Intel: x         123           0           0           0 iostat          -1 which
!           2 iomsg end-of-file during read, unit -5, file Internal Formatted Read
! NVF: x            0            0            0            0 iostat          212
!           which            1 iomsg invalid unit number
! NAG: x 123 234 345 0 iostat -2 which 4 iomsg End of record on internal file
! XLF: x 123 234 456 0 iostat -4 which 4 iomsg "child-io-eor.f90", line 50: 1525-031 The non-advancing READ...

module m
  type t
    integer j(4)
   contains
     procedure :: tfread
     generic :: read(formatted) => tfread
  end type
  integer which
 contains
  subroutine tfread(dtv,unit,iotype,vlist,iostat,iomsg)
    class(t), intent(in out) :: dtv
    integer, intent(in) :: unit, vlist(:)
    character(*), intent(in) :: iotype
    integer, intent(out) :: iostat
    character(*), intent(in out) :: iomsg
    iostat = 0
    dtv%j = 0
    which = 0
    ! first read obviously gets 123
    read(unit, *, iostat=iostat, iomsg=iomsg) dtv%j(1)
    if (iostat /= 0) then
      which = 1
      return
    end if
    ! At the end of the first record.  This is child I/O,
    ! so we must not advance to the next record; see F'2023
    ! 12.6.4.8.3 paragraph 3.  This is list-directed I/O
    ! so it terminates early.  Nothing happens, and there
    ! is no end-of-record error.
    read(unit, *, iostat=iostat, iomsg=iomsg) dtv%j(2)
    if (iostat /= 0) then
      which = 2
      return
    end if
    ! Still at the end of the first record, still doing
    ! child input.  This is formatted I/O with explicit
    ! record advancement, so it reads 234 from the second
    ! record.  There is no automatic advancement to the
    ! third record, so we stay at the end of the second.
    read(unit, 1, iostat=iostat, iomsg=iomsg) dtv%j(3)
1   format(/I3)
    if (iostat /= 0) then
      which = 3
      return
    end if
    ! Still at the end of the second record, still doing
    ! child input.  This is formatted I/O, so it has to
    ! get a value; there isn't one, and there's no explicit
    ! advancement, so it should fail with an EOR condition.
    read(unit, 2, iostat=iostat, iomsg=iomsg) dtv%j(4)
2   format(I4)
    if (iostat /= 0) then
      which = 4
      return
    end if
  end
  subroutine test
    character(3) buffer(4)
    integer iostat
    character(80) iomsg
    type(t) x
    buffer = ['123', '234', '345', '456']
    iomsg = ''
    read(buffer, "(DT't')", iostat=iostat, iomsg=iomsg) x
    print *, 'x', x, 'iostat', iostat, 'which', which, 'iomsg ', trim(iomsg)
  end
end

use m
call test
end
