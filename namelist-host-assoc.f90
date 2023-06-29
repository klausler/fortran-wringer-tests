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
