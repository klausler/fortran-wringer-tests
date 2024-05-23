! What happens when PRIVATE KIND appears in a module with no other declaration?
module m
  private kind
 contains
  integer function f(n)
    integer(kind(0)) :: k = kind(0)
    integer, intent(in) :: n
    f = k + n
  end function
end module
use m
print *, f(0)
end
