! If an intrinsic function does not appear in an explicit INTRINSIC
! statement in a module's specification part, but is referenced in
! a declaration or initialization, is it still considered to be part
! of the module to be USE-associated into other scopes?
module explicit
  intrinsic cos
end
subroutine testExplicit
  use explicit
  real :: cos = 2. ! must be an error
end
module implicit
  real :: one = cos(0.)
end
subroutine testImplicit
  use implicit
  real :: cos = 2. ! may or may not be an error
end
