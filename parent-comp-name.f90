! Is the name of a parent component the same name that appears
! in the EXTENDS() specification, or the name of the ultimate
! symbol after all USE association is resolved?
module m1
  type foo
  end type
end
module m2
  use m1, derived_type => foo
end
use m2, dt => derived_type
type, extends(dt) :: mytype
  integer :: foo ! an error?
end type
print *, 'ok'
end
