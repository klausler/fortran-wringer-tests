! Are ASSOCIATE entities assumed to not alias?
module m
 contains
  subroutine copy(to,from)
    real, pointer, contiguous :: to(:), from(:)
    associate (t => to, f => from)
      t = f
    end associate
  end subroutine
end

program test
  use m
  integer, parameter :: n = 1000
  real, allocatable, target :: a(:)
  real, pointer, contiguous :: pa(:), pb(:)
  allocate(a(n))
  do j = 1, n
    a(j) = j
  end do
  pa => a(2:n)
  pb => a(1:n-1)
  call copy(pa, pb)
  print *, a(2), a(n), sum(pa), n*(n-1)/2
end
