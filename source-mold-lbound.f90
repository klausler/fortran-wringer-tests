module m
 contains
  function foo()
    real, allocatable :: foo(:)
    allocate(foo(-1:1))
  end
end

program test
  use m
  real, allocatable :: a(:)
  real :: b(-2:1)
  allocate(a, mold=b)
  print *, 'should be -2:', lbound(a)
  deallocate(a)
  allocate(a, source=b)
  print *, 'should be -2:', lbound(a)
  deallocate(a)
  allocate(a, mold=(b))
  print *, 'should be 1:', lbound(a)
  deallocate(a)
  allocate(a, source=(b))
  print *, 'should be 1:', lbound(a)
  deallocate(a)
  allocate(a, mold=b+0.)
  print *, 'should be 1:', lbound(a)
  deallocate(a)
  allocate(a, source=b+0.)
  print *, 'should be 1:', lbound(a)
  deallocate(a)
  allocate(a, mold=foo())
  print *, 'should be 1:', lbound(a)
  deallocate(a)
  allocate(a, source=foo())
  print *, 'should be 1:', lbound(a)
  deallocate(a)
end
