! Does NAMELIST output respect USE renaming?
module m
  integer :: name_in_module = 123
end module

use m, name_in_program => name_in_module
namelist /nl/ name_in_program
write(*,nl)
end
