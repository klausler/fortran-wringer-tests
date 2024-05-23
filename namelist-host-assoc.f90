! Does a name whose first appearance in a scope is as part of a
! NAMELIST group resolve to a local declaration or to a host
! association?
program main
  real :: x = 3.14159
  call subr
 contains
  subroutine subr
    namelist /nl/ x
    integer :: x
    write(*,nml=nl)
  end
end
